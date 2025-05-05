

#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include "semant.h"
#include "utilities.h"
#include <map>
#include <vector>
#include <set>
#include <algorithm>


extern int semant_debug;
extern char *curr_filename;

/*
 *定义一个symbol table,记录id和其类型,symbol是一个指针
 *除了特殊的self，id可以在，(1)类的attribute,(2)方法的参数,(3)let表达式,(4)case表达式中引入
 *那么符号表可以使用scope为atribute->方法->嵌套的表达式。
 *语法允许在不同scope下，定义相同名字，不同类型的id。
 */
SymbolTable<Symbol, Symbol> *sym_tab = new SymbolTable<Symbol, Symbol>();
/*类型C和方法参数类型返回类型的映射*/
std::map<Symbol, std::map<Symbol, std::vector<Symbol>>> class_method_map;
// std::map<Symbol, std::vector<Symbol>> method_info;
std::map<Symbol, Class_> class_info;
Class_ class_sement;
ClassTable *classtable;
std::map<Symbol, std::map<Symbol, Symbol>> class_attribute;

//////////////////////////////////////////////////////////////////////
//
// Symbols
//
// For convenience, a large number of symbols are predefined here.
// These symbols include the primitive type and method names, as well
// as fixed names used by the runtime system.
//
//////////////////////////////////////////////////////////////////////
static Symbol 
    arg,
    arg2,
    Bool,
    concat,
    cool_abort,
    copy,
    Int,
    in_int,
    in_string,
    IO,
    length,
    Main,
    main_meth,
    No_class,
    No_type,
    Object,
    out_int,
    out_string,
    prim_slot,
    self,
    SELF_TYPE,
    Str,
    str_field,
    substr,
    type_name,
    val;
//
// Initializing the predefined symbols.
//
static void initialize_constants(void)
{
    arg         = idtable.add_string("arg");
    arg2        = idtable.add_string("arg2");
    Bool        = idtable.add_string("Bool");
    concat      = idtable.add_string("concat");
    cool_abort  = idtable.add_string("abort");
    copy        = idtable.add_string("copy");
    Int         = idtable.add_string("Int");
    in_int      = idtable.add_string("in_int");
    in_string   = idtable.add_string("in_string");
    IO          = idtable.add_string("IO");
    length      = idtable.add_string("length");
    Main        = idtable.add_string("Main");
    main_meth   = idtable.add_string("main");
    //   _no_class is a symbol that can't be the name of any 
    //   user-defined class.
    No_class    = idtable.add_string("_no_class");
    No_type     = idtable.add_string("_no_type");
    Object      = idtable.add_string("Object");
    out_int     = idtable.add_string("out_int");
    out_string  = idtable.add_string("out_string");
    prim_slot   = idtable.add_string("_prim_slot");
    self        = idtable.add_string("self");
    SELF_TYPE   = idtable.add_string("SELF_TYPE");
    Str         = idtable.add_string("String");
    str_field   = idtable.add_string("_str_field");
    substr      = idtable.add_string("substr");
    type_name   = idtable.add_string("type_name");
    val         = idtable.add_string("_val");
}

std::vector<Symbol> get_parents(Symbol curr) {
    // 可以直接返回vector,编译器会用 Return Value Optimization (RVO) 来避免多余拷贝
    std::vector<Symbol> result;
    while (class_info.count(curr) && class_info[curr]->get_parent() != No_class) {
        curr = class_info[curr]->get_parent();
        if(class_info.count(curr)) {
            // 只添加已经定义的7父类，后面继续分析
            result.push_back(curr);
        }
    }
    return result;
}

std::vector<Symbol> get_parents_self(Symbol curr) {
    std::vector<Symbol> result;
    result.push_back(curr);
    while (class_info.count(curr) && class_info[curr]->get_parent() != No_class) {
        curr = class_info[curr]->get_parent();
        if(class_info.count(curr)) {
            // 只添加已经定义的7父类，后面继续分析
            result.push_back(curr);
        }
    }
    return result;
}

bool is_child(Symbol c, Symbol p) {
    // 相等也成立
    auto parents = get_parents(c);
    parents.push_back(c);
    if(std::find(parents.begin(), parents.end(), p) != parents.end()) {
        return true;
    }
    return false;
}

bool conform(Symbol a, Symbol b) {
    //检查是否a <= b。 如果b是SELF_TYPE,那么a必须是SELF_TYPE
    if(b == SELF_TYPE) {
        if(a == SELF_TYPE) {
            return true;
        }
        return false;
    }
    if(a == SELF_TYPE) {
        a = class_sement->get_name();
    }
    return is_child(a, b);

}

Symbol get_common_ancestor(Symbol a, Symbol b) {
    // 一些非法的表达式会设置类型No_type，此时统一 返回Object继续分析
    if(a == No_type || b == No_type) {
        return Object;
    }
    auto parents1 = get_parents_self(a);
    auto parents2 = get_parents_self(b);
    Symbol res;
    int i = parents1.size() - 1;
    int j = parents2.size() - 1;
    while (i >= 0 && j >= 0 && parents1[i] == parents2[j]) {
        res = parents1[i];
        --i;
        --j;
    }
    return res;
}

bool check_cycle(const std::map<Symbol, Class_>& class_info) {
    std::set<Symbol> visited;
    for (const auto& [node, cls] : class_info) {
        Symbol current = node;
        std::set<Symbol> path;
        while (class_info.count(current)) {
            if (path.count(current)) {
                return true;  // 在同一路径中重复访问，存在环
            }
            if (visited.count(current)) {
                break;  // 已处理，跳过
            }
            path.insert(current);
            Class_ current_class = class_info.at(current);
            current = current_class->get_parent();  // 获取父类Symbol
        }
        // 将当前路径中访问的节点标记为已处理
        visited.insert(path.begin(), path.end());
    }
    return false;  // 没有检测到环
}



ClassTable::ClassTable(Classes classes) : semant_errors(0) , error_stream(cerr) {

    /* Fill this in */
    install_basic_classes();
    for(int i = classes->first(); classes->more(i); i = classes->next(i)) {
        Class_ curr = classes->nth(i);
        if(curr->get_name() == SELF_TYPE) {
            semant_error(curr->get_filename(), curr) << "class name cannot be " << curr->get_name() << ".\n";
        }else if(class_info.count(curr->get_name())) {
            // 类型不能重复定义
            semant_error(curr->get_filename(), curr) << "Redefinition of class " << curr->get_name() << ".\n";
        }else {
            class_info[curr->get_name()] = curr;
        }
    }

    // 检查是否有main类和main方法,Todo:方法检查放在哪里
    // 每个文件都有main吗，编译的时候多个文件链接是什么情况
    if(!class_info.count(Main)) {
        semant_error() << "Class Main is not defined.\n";
    }

    // 检查是否存在环
    if(check_cycle(class_info)) {
        semant_error() << "inheritance graph has cycle\n";
    }

    // 检查父类是否存在,父类不能是Bool、Int、String
    for(const auto& [node, curr_class] : class_info) {
        if(curr_class != class_info[Object] && !class_info.count(curr_class->get_parent())) {
            semant_error(curr_class->get_filename(), curr_class) << "class " << node << " inherits from an undefined class " << curr_class->get_parent() << "\n";
        }
        if(curr_class->get_parent() == Bool) {
            semant_error(curr_class->get_filename(), curr_class) << "class " << node << " cannot inherit class Bool.\n";
        }
        if(curr_class->get_parent() == Int) {
            semant_error(curr_class->get_filename(), curr_class) << "class " << node << " cannot inherit class Int.\n";
        }
        if(curr_class->get_parent() == Str) {
            semant_error(curr_class->get_filename(), curr_class) << "class " << node << " cannot inherit class Str.\n";
        }
    }

}

Symbol class__class::get_name(){
    return name;
}

Symbol class__class::get_parent(){
    return parent;
}

void class__class::gather_method_info() {
    class_method_map[name] = {};
    for(int i = features->first(); features->more(i); i = features->next(i)) {
        Feature curr = features->nth(i);
        if (method_class* method = dynamic_cast<method_class*>(curr)) {
            method->add_mathod_map(name);
            auto method_name = method->get_name();
            auto& method_signature = class_method_map[name][method_name];
            auto parents = get_parents(name);
            // 判断这个方法是否有父类的同名方法参数类型或者数量不同
            for(auto& p : parents) {
                if(class_method_map[p].count(method_name)) {
                    auto& method_signature_p = class_method_map[p][method_name];
                    if(method_signature.size() != method_signature_p.size()) {
                        classtable->semant_error(get_filename(), method) << \
                            "Incompatible number of formal parameters in redefined method " << method_name <<".\n";
                        break;
                    }
                    if(method_signature != method_signature_p) {
                        classtable->semant_error(get_filename(), method) << \
                            "different parameters type in redefined method " << method_name <<".\n";
                        break;
                    }
                }
            }
        }
    }
}

void class__class::gather_attribute_info(Symbol gather_class) {
    std::set<Symbol> curr_attrs;
    for(int i = features->first(); features->more(i); i = features->next(i)) {
        Feature curr = features->nth(i);
        if (attr_class* attr = dynamic_cast<attr_class*>(curr)){
            if(name != gather_class) {
                class_attribute[gather_class][attr->get_name()] = attr->get_type_decl();
                continue;
            }
            if(attr->get_name() == self) {
                classtable->semant_error(get_filename(), attr) << "'self' cannot be the name of an attribute.\n";
            }else if(curr_attrs.count(attr->get_name())) {
                classtable->semant_error(get_filename(), attr) << "Attribute " << attr->get_name() << " is multiply defined in class.\n";
            }else if(class_attribute[gather_class].count(attr->get_name())) {
                classtable->semant_error(get_filename(), attr) << "Attribute " << attr->get_name() << " is an attribute of an inherited class.\n";
            }else {
                class_attribute[gather_class][attr->get_name()] = attr->get_type_decl();
            }
            curr_attrs.insert(attr->get_name());
        }
    }
}

void class__class::semant() {
    /*
     *把attr的名称与类型加入到symbol table中，attr不能重名(在gather阶段可以判断)，对atrrbute中的表达式进行type检查
     *class C {a : Int <- b+1; b : Int <- a+1;}是合法的,可以考虑把所有的init加入符号表再检查表达式的类型
     *对method进行语义分析
     */
    class_sement = this;
    sym_tab->enterscope();
    for(auto& [attr_name, attr_type] : class_attribute[name]) {
        // cout << name <<": " << attr_name << ", " << attr_type <<endl;
        sym_tab->addid(attr_name, &attr_type);
    }

    for(int i = features->first(); features->more(i); i = features->next(i)) {
        Feature curr = features->nth(i);
        if (method_class* method = dynamic_cast<method_class*>(curr)) {
            method->semant();
        }else if (attr_class* attr = dynamic_cast<attr_class*>(curr)){
            attr->get_init()->semant();
            // init非法或者代码中没有init
            if(attr->get_init()->get_type() == No_type) {
                continue;
            }
            Symbol type_decl = attr->get_type_decl();
            Symbol inferred_type = attr->get_init()->get_type();
            if(!conform(inferred_type, type_decl)) {
                classtable->semant_error(class_sement->get_filename(), attr) << \
                        "Inferred type " << inferred_type << " of initialization of attribute " << \
                        attr->get_name() << " does not conform to declared type " << type_decl <<".\n";
            }
        }
    }
    sym_tab->exitscope();
}

void method_class::add_mathod_map(Symbol class_name) {
    // 检查方法的重名，bool不支持重写，foo() :Int{1}; foo(x : Int) :Int{1};尽管参数一样，但是是不合法的
    // 子类重载父类的方法，必须参数保持一致
    if(class_method_map[class_name].count(name)) {
        classtable->semant_error(class_sement->get_filename(), this) << "Method " << name << " is multiply defined in class.\n";
        return;
    }
    for(int i = formals->first(); formals->more(i); i = formals->next(i)) {
        class_method_map[class_name][name].push_back(formals->nth(i)->get_type());
    }
    class_method_map[class_name][name].push_back(return_type);
}

Symbol method_class::get_name() {
    return name;
}

Expression attr_class::get_init() {
    return init;
}

Symbol attr_class::get_name() {
    return name;
}

Symbol attr_class::get_type_decl() {
    return type_decl;
}

void method_class::semant() {
    /*
     *将参数添加到symbol table中, 参数不能重名
     *对expr进行语义分析
     *检查返回类型,expr的类型有可能是SELF_TYPE时，需要验证函数的声明返回类型是不是当前的类。（声明类型有可能是SELF_TYPE）
     *class C{item : B;foo() : SELF_TYPE {item};};class B inherits C {};
     *对于声明上面返回值是SELF_TYPE，实际的返回类型不能是子类。因为SELF_TYPE的一大作用就是子类继承，返回子类本身的对象。
     *forrmal的名称不能是self
     */
    sym_tab->enterscope();
    for(int i = formals->first(); formals->more(i); i = formals->next(i)) {
        if(formals->nth(i)->get_name() == self) {
            classtable->semant_error(class_sement->get_filename(), this) << \
                "'self' cannot be the name of a formal parameter.\n";
        }
        // 分析为什么函数参数的类型不能是SELF_TYPE
        if(formals->nth(i)->get_type() == SELF_TYPE) {
            classtable->semant_error(class_sement->get_filename(), this) << \
                "Formal parameter " << formals->nth(i)->get_name() << " cannot have type SELF_TYPE.\n";
        }
        formals->nth(i)->add_symbol();
    }
    expr->semant();
    Symbol inferred_type = expr->get_type();
    if(!conform(inferred_type, return_type)) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "Inferred return type " << inferred_type << " of method " << name << \
            " does not conform to declared return type " << return_type << ".\n";
    }
    sym_tab->exitscope();
}

void formal_class::add_symbol() {
    if(sym_tab->probe(name)) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "Formal parameter " << name << " is multiply defined.\n";
    }else {
        sym_tab->addid(name, &type_decl);
    }
}

Symbol formal_class::get_type() {
    return type_decl;
}

Symbol formal_class::get_name() {
    return name;
}

void assign_class::semant() {
    /*
     *对右边的表达式进行语义分析，得到其类型
     *检查当前变量是否定义、表达式的类型与当前变量是否合法
     *设置类型为右边i表达式的类型
     *语句的结果有可能是SELF_TYPE,变量也可能是SELF_TYPE(如定义类的attribute："a : SELF_TYPE;")
     *与method一样，对于声明是SELF_TYPE，expr类型不能是子类。
     */
    expr->semant();
    if(name == self) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "Cannot assign to 'self'.\n";
    } else if (!sym_tab->lookup(name)) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "Assignment to undeclared variable " << name << ".\n";
    }else {
        Symbol type_decl = *(sym_tab->lookup(name));
        if(!conform(expr->get_type(), type_decl)) {
            classtable->semant_error(class_sement->get_filename(), this) << \
                "Type " << expr->get_type() << " of assigned expression does not conform to declared type " << \
                type_decl << " of identifier " << name << ".\n";
        }
    }
    type = expr->get_type();
}

void static_dispatch_class::semant() {
     /*
     *e0@T.f(e1,...,en)
     *expr(e0)语义分析，其类型为T,(有可能是SELF_TYPE)，检查其符合type_name
     *e1-en进行语义分析。这些类型符合M(type_name, name)，
     *返回参数的类型是M映射中的类型，如果这个类型是SELF_TYPE，那么类型为e0的类型
     */
    expr->semant();
    Symbol e0_type = expr->get_type();
    // type_name不能是SELF_TYPE
    if(type_name == SELF_TYPE) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "Static dispatch to SELF_TYPE.\n";
            type =No_type;
        return;
    }
    if(!conform(e0_type, type_name)) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "Expression type " << e0_type << " does not conform to declared static dispatch type " << type_name << ".\n";
        type =No_type;
        return;
    }
    

    std::vector<Symbol> actual_params;
    for(int i = actual->first(); actual->more(i); i = actual->next(i)) {
        actual->nth(i)->semant();
        actual_params.push_back(actual->nth(i)->get_type());
    }
    // 使用声明的类型
    if(!class_method_map.count(type_name)) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "Static dispatch to undefined class " << type_name << ".\n";
        type =No_type;
        return;
    }

    auto parents = get_parents_self(type_name);
    bool found_method = false;
    for(auto& cls : parents) {
        if(class_method_map[cls].count(name)) {
            if(actual_params.size() != class_method_map[cls][name].size()-1) {
                classtable->semant_error(class_sement->get_filename(), this) << \
                    "Method " << name << " invoked with wrong number of arguments.\n";
            }
            for(size_t i = 0; i < actual_params.size(); ++i) {
                if(!conform(actual_params[i], class_method_map[cls][name][i])) {
                    classtable->semant_error(class_sement->get_filename(), this) << \
                        "In call of method " << name << ", type " << actual_params[i] << \
                        " parameter " << "Todo"<<" does not conform to declared type " << \
                        class_method_map[cls][name][i] << ".\n";
                }
            }
            // 设置dispatch表达式类型
            Symbol decl_return_type = class_method_map[cls][name].back();
            if(decl_return_type == SELF_TYPE) {
                type = e0_type;
            }else {
                type = decl_return_type;
            }
            found_method = true;
            break;
        }
    }

    if(!found_method) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "Dispatch to undefined method " << name << ".\n";
        // type设置为notype,后续的分析可以直接调用get_type 
        type = No_type;
    }
}

void dispatch_class::semant() {
    /*
     *e0.f(e1,...,en)
     *expr(e0)语义分析，其类型为T,当类型为SELF_TYPE时，T是当前的类。检查这个类存在,可以在expr中判读
     *e1-en进行语义分析。这些类型<=M(T, name)
     *返回参数的类型是M映射中的类型，如果这个类型是SELF_TYPE，那么类型为e0的类型
     */
    expr->semant();
    Symbol e0_type = expr->get_type();
    Symbol check_type = e0_type;
    if(e0_type == SELF_TYPE) {
        check_type = class_sement->get_name();
    }
    std::vector<Symbol> actual_params;
    for(int i = actual->first(); actual->more(i); i = actual->next(i)) {
        actual->nth(i)->semant();
        actual_params.push_back(actual->nth(i)->get_type());
    }

    auto parents = get_parents_self(check_type);
    bool found_method = false;
    for(auto& cls : parents) {
        if(class_method_map[cls].count(name)) {
            if(actual_params.size() != class_method_map[cls][name].size()-1) {
                classtable->semant_error(class_sement->get_filename(), this) << \
                    "Method " << name << " invoked with wrong number of arguments.\n";
            }
            for(size_t i = 0; i < actual_params.size(); ++i) {
                // Todo:self type
                if(!conform(actual_params[i], class_method_map[cls][name][i])) {
                    classtable->semant_error(class_sement->get_filename(), this) << \
                        "In call of method " << name << ", type " << actual_params[i] << \
                        " does not conform to declared type " << \
                        class_method_map[cls][name][i] << ".\n";
                }
            }
            // 设置dispatch表达式类型
            Symbol decl_return_type = class_method_map[cls][name].back();
            if(decl_return_type == SELF_TYPE) {
                type = e0_type;
            }else {
                type = decl_return_type;
            }
            found_method = true;
            break;
        }
    }
    if(!found_method) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "Dispatch to undefined method " << name << ".\n";
        // type设置为notype,后续的分析可以直接调用get_type 
        type = No_type;
    }
}

void cond_class::semant() {
    /*
     *对pred then_exp else_exp等进行语义分析
     *验证pred的返回值是bool
     *type设置为then_exp和else_exp的公共父类。SELF_TYPE使用本类型运算
     */
    pred->semant();
    if(pred->get_type() != Bool) {
        classtable->semant_error(class_sement->get_filename(), this) << \
           "Predicate of 'if' does not have type Bool.\n"; 
    }
    then_exp->semant();
    else_exp->semant();
    Symbol then_type = then_exp->get_type();
    Symbol else_type = else_exp->get_type();
    if(then_type == SELF_TYPE) {
        then_type = class_sement->get_name();
    }
    if(else_type == SELF_TYPE) {
        else_type = class_sement->get_name();
    }
    type = get_common_ancestor(then_type, else_type);
}

void loop_class::semant() {
    /*
     *while条件是bool类型，整个while表达式是object类型
     */
    pred->semant();
    if(pred->get_type() != Bool) {
        classtable->semant_error(class_sement->get_filename(), this) << \
           "Loop condition does not have type Bool.\n"; 
    }
    body->semant();
    type = Object;
}

void block_class::semant() {
    /*
     *block的上一条语句不会影响下一个symbol table(与c语言等不同，引入变量需要在let等语句中)
     *每条语句进行语义分析，type设置为最后语句的类型
     */
    for(int i = body->first(); body->more(i); i = body->next(i)) {
        body->nth(i)->semant();
        type = body->nth(i)->get_type();
    }
}

void typcase_class::semant() {
    /*
     *对expr进行语义分析。对每个case(具体为branch_class)进行语义语义分析。
     *整个表达式的类型是casee类型的最小公共父类
     *每个branch声明的类型必须不相同
     */
    expr->semant();
    Symbol res = nullptr;
    std::set<Symbol> case_types;
    for(int i = cases->first(); cases->more(i); i = cases->next(i)) {
        Symbol type_decl = cases->nth(i)->get_type_decl();
        if(case_types.count(type_decl)) {
            classtable->semant_error(class_sement->get_filename(), this) << \
                "Duplicate branch " << type_decl << " in case statement.\n"; 
        }
        case_types.insert(type_decl);
    }
    for(int i = cases->first(); cases->more(i); i = cases->next(i)) {
        Symbol case_type = cases->nth(i)->semant();
        if(case_type == SELF_TYPE) {
            case_type = class_sement->get_name();
        }
        if(!res) {
            res = case_type;
        }else {
            res = get_common_ancestor(res, case_type);
        }
    }
    type = res;
    
}

Symbol branch_class::semant() {
    /*
     *sybol表中添加类型(name和type_decl)
     *返回类型expr的类型，使得typcase_class进行汇总分析
     */
    sym_tab->enterscope();
    sym_tab->addid(name, &type_decl);
    expr->semant();
    Symbol type = expr->get_type();
    sym_tab->exitscope();
    return type;
}

Symbol branch_class::get_type_decl() {
    return type_decl;
}

void let_class::semant() {
    /*
     *init语义分析，检查类型是否<=e声明的类型type_decl
     *添加identifier到symbol表格中，对body进行语义分析
     *类型设置为body的类型
     *let中init为空,名称不能是self
     */
    if(identifier == self) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "'self' cannot be bound in a 'let' expression.\n";
    }

    if(!dynamic_cast<no_expr_class*>(init)) {
        init->semant();
        Symbol init_type = init->get_type();
        // type_decl也可能是SELF_TYPE，此时init_type也必须为SELF_TYPE
        if(type_decl == SELF_TYPE && init_type != SELF_TYPE) {
            classtable->semant_error(class_sement->get_filename(), this) << \
                    "Inferred type " << init_type <<" of initialization of " << identifier \
                    << " does not conform to identifier's declared type " << type_decl <<".\n";
        }

        
        if(!conform(init_type, type_decl)) {
            classtable->semant_error(class_sement->get_filename(), this) << \
                    "Inferred type " << init_type <<" of initialization of " << identifier \
                    << " does not conform to identifier's declared type " << type_decl <<".\n";
        }
    }

    sym_tab->enterscope();
    // 这里考虑SELF_TYPE
    sym_tab->addid(identifier, &type_decl);
    body->semant();
    type = body->get_type();
    sym_tab->exitscope();
}

void plus_class::semant() {
    /*
     *e1和e2语义分析，类型都是int。整个表达式的类型是int
     */
    e1->semant();
    e2->semant();
    if(e1->get_type() != Int || e2->get_type() != Int) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "non-Int arguments" << e1->get_type() << " + " << e2->get_type() << endl;
    }
    type = Int;
}

void sub_class::semant() {
    /*
     *e1和e2语义分析，类型都是int。整个表达式的类型是int
     */
    e1->semant();
    e2->semant();
    if(e1->get_type() != Int || e2->get_type() != Int) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "non-Int arguments" << e1->get_type() << " - " << e2->get_type() << endl;
    }
    type = Int;
}

void mul_class::semant() {
    /*
     *e1和e2语义分析，类型都是int。整个表达式的类型是int
     */
    e1->semant();
    e2->semant();
    if(e1->get_type() != Int || e2->get_type() != Int) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "non-Int arguments" << e1->get_type() << " * " << e2->get_type() << endl;
    }
    type = Int;
}

void divide_class::semant() {
    /*
     *e1和e2语义分析，类型都是int。整个表达式的类型是int
     */
    e1->semant();
    e2->semant();
    if(e1->get_type() != Int || e2->get_type() != Int) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "non-Int arguments" << e1->get_type() << " / " << e2->get_type() << endl;
    }
    type = Int;
}

void neg_class::semant() {
    /*
     *e1语义分析，类型是int。整个表达式的类型是int
     */
    e1->semant();
    if(e1->get_type() != Int) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "Argument of '~' has type " << e1->get_type() << " instead of Int." << endl;
    }
    type = Int;
}

void lt_class::semant() {
    /*
     *e1和e2语义分析，类型都是int。整个表达式的类型是bool
     */
    e1->semant();
    e2->semant();
    if(e1->get_type() != Int || e2->get_type() != Int) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "non-Int arguments " << e1->get_type() << " < " << e2->get_type() << endl;
    }
    type = Bool;
}

void eq_class::semant() {
    /*
     *e1和e2语义分析。不同类型可以自由比较，除了(Int,Bool,String),这三个必须和自己比较
     *整个表达式的类型是bool
     */
    e1->semant();
    e2->semant();
    Symbol e1_type = e1->get_type();
    Symbol e2_type = e2->get_type();
    if(e1_type == Int || e2_type == Int ||  e1_type == Bool || e2_type == Bool || 
            e1_type == Str || e2_type == Str) {
        if(e1_type != e2_type) {
            classtable->semant_error(class_sement->get_filename(), this) << \
                "Illegal comparison with a basic type." << endl;
        }
    }
    type = Bool;
}

void leq_class::semant() {
    /*
     *e1和e2语义分析，类型都是int。整个表达式的类型是bool
     */
    e1->semant();
    e2->semant();
    if(e1->get_type() != Int || e2->get_type() != Int) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "non-Int arguments " << e1->get_type() << " <= " << e2->get_type() << endl;
    }
    type = Bool;
}

void comp_class::semant() {
    /*
     *e1语义分析，类型是Bool。整个表达式的类型是Bool
     */
    e1->semant();
    if(e1->get_type() != Bool) {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "Argument of 'not' has type " << e1->get_type() << " instead of Bool." << endl;
    }
    type = Bool;
}

void int_const_class::semant() {
    /*
     *设置类型为Int
     */
    type = Int;
}

void bool_const_class::semant() {
    /*
     *设置类型为Bool
     */
    type = Bool;
}

void string_const_class::semant() {
    /*
     *设置类型为Bool
     */
    type = Str;
}

void new__class::semant() {
    /*
     *类型设置为T,对于SELF_TYPE,标记为SELF_TYPE
     *判断类型是否存在
     */
    if(type_name != SELF_TYPE) {
        if(!class_info.count(type_name)) {
            classtable->semant_error(class_sement->get_filename(), this) << \
            "'new' used with undefined class " << type_name << ".\n";
            type = No_type;
            return;
        }
    }
    type = type_name;
}

void isvoid_class::semant() {
    /*
     *类型设置为Bool
     */
    e1->semant();
    type = Bool;
}

void no_expr_class::semant() {
    // 先不做处理，这里可能是和let相关的部分
    type = No_type;
}

void object_class::semant() {
    /*
     *检查id是否有意义，然后设置类型
     */
    if(name == self) {
        type = SELF_TYPE;
        return;
    }
    if(sym_tab->lookup(name)) {
        type = *(sym_tab->lookup(name));
    }else {
        classtable->semant_error(class_sement->get_filename(), this) << \
            "Undeclared identifier " << name << ".\n";
        type = No_type;
    }
}


void ClassTable::install_basic_classes() {

    // The tree package uses these globals to annotate the classes built below.
   // curr_lineno  = 0;
    Symbol filename = stringtable.add_string("<basic class>");
    
    // The following demonstrates how to create dummy parse trees to
    // refer to basic Cool classes.  There's no need for method
    // bodies -- these are already built into the runtime system.
    
    // IMPORTANT: The results of the following expressions are
    // stored in local variables.  You will want to do something
    // with those variables at the end of this method to make this
    // code meaningful.

    // 
    // The Object class has no parent class. Its methods are
    //        abort() : Object    aborts the program
    //        type_name() : Str   returns a string representation of class name
    //        copy() : SELF_TYPE  returns a copy of the object
    //
    // There is no need for method bodies in the basic classes---these
    // are already built in to the runtime system.

    Class_ Object_class =
	class_(Object, 
	       No_class,
	       append_Features(
			       append_Features(
					       single_Features(method(cool_abort, nil_Formals(), Object, no_expr())),
					       single_Features(method(type_name, nil_Formals(), Str, no_expr()))),
			       single_Features(method(copy, nil_Formals(), SELF_TYPE, no_expr()))),
	       filename);

    // 
    // The IO class inherits from Object. Its methods are
    //        out_string(Str) : SELF_TYPE       writes a string to the output
    //        out_int(Int) : SELF_TYPE            "    an int    "  "     "
    //        in_string() : Str                 reads a string from the input
    //        in_int() : Int                      "   an int     "  "     "
    //
    Class_ IO_class = 
	class_(IO, 
	       Object,
	       append_Features(
			       append_Features(
					       append_Features(
							       single_Features(method(out_string, single_Formals(formal(arg, Str)),
										      SELF_TYPE, no_expr())),
							       single_Features(method(out_int, single_Formals(formal(arg, Int)),
										      SELF_TYPE, no_expr()))),
					       single_Features(method(in_string, nil_Formals(), Str, no_expr()))),
			       single_Features(method(in_int, nil_Formals(), Int, no_expr()))),
	       filename);  

    //
    // The Int class has no methods and only a single attribute, the
    // "val" for the integer. 
    //
    Class_ Int_class =
	class_(Int, 
	       Object,
	       single_Features(attr(val, prim_slot, no_expr())),
	       filename);

    //
    // Bool also has only the "val" slot.
    //
    Class_ Bool_class =
	class_(Bool, Object, single_Features(attr(val, prim_slot, no_expr())),filename);

    //
    // The class Str has a number of slots and operations:
    //       val                                  the length of the string
    //       str_field                            the string itself
    //       length() : Int                       returns length of the string
    //       concat(arg: Str) : Str               performs string concatenation
    //       substr(arg: Int, arg2: Int): Str     substring selection
    //       
    Class_ Str_class =
	class_(Str, 
	       Object,
	       append_Features(
			       append_Features(
					       append_Features(
							       append_Features(
									       single_Features(attr(val, Int, no_expr())),
									       single_Features(attr(str_field, prim_slot, no_expr()))),
							       single_Features(method(length, nil_Formals(), Int, no_expr()))),
					       single_Features(method(concat, 
								      single_Formals(formal(arg, Str)),
								      Str, 
								      no_expr()))),
			       single_Features(method(substr, 
						      append_Formals(single_Formals(formal(arg, Int)), 
								     single_Formals(formal(arg2, Int))),
						      Str, 
						      no_expr()))),
	       filename);
    
    class_info[Object] = Object_class;
    class_info[IO] = IO_class;
    class_info[Int] = Int_class;
    class_info[Bool] = Bool_class;
    class_info[Str] = Str_class;
}

////////////////////////////////////////////////////////////////////
//
// semant_error is an overloaded function for reporting errors
// during semantic analysis.  There are three versions:
//
//    ostream& ClassTable::semant_error()                
//
//    ostream& ClassTable::semant_error(Class_ c)
//       print line number and filename for `c'
//
//    ostream& ClassTable::semant_error(Symbol filename, tree_node *t)  
//       print a line number and filename
//
///////////////////////////////////////////////////////////////////

ostream& ClassTable::semant_error(Class_ c)
{                                                             
    return semant_error(c->get_filename(),c);
}    

ostream& ClassTable::semant_error(Symbol filename, tree_node *t)
{
    error_stream << filename << ":" << t->get_line_number() << ": ";
    return semant_error();
}

ostream& ClassTable::semant_error()                  
{                                                 
    semant_errors++;                            
    return error_stream;
} 



/*   This is the entry point to the semantic checker.

     Your checker should do the following two things:

     1) Check that the program is semantically correct
     2) Decorate the abstract syntax tree with type information
        by setting the `type' field in each Expression node.
        (see `tree.h')

     You are free to first do 1), make sure you catch all semantic
     errors. Part 2) can be done in a second stage, when you want
     to build mycoolc.
 */
void program_class::semant()
{
    initialize_constants();

    /* ClassTable constructor may do some semantic analysis */
    classtable = new ClassTable(classes);

    /* 汇总每个类的method信息，分析子类是否有和父类重名，但是参数返回类型不同的情况 */
    for(auto& [name, curr] : class_info) {
        auto parents = get_parents_self(name);
        // 从object开始gather，分析当前类的时候，其父类已经汇总好method信息
        for(auto it = parents.rbegin(); it != parents.rend(); ++it) {
            if(!class_method_map.count(*it)) {
                class_info[*it]->gather_method_info();
            }
        }
    }

    /* 汇总每个类的attribute信息,每个父类的attribute信息也要合并*/
    for(auto& [name, curr] : class_info) {
        auto parents = get_parents_self(name);
        // 从object开始gather,当前类会报错(重名，定义之前定义过的attr)
        for(auto it = parents.rbegin(); it != parents.rend(); ++it) {
            class_info[*it]->gather_attribute_info(name);
        }
    }

    /*对每一个class进行语义分析*/
    for(int i = classes->first(); classes->more(i); i = classes->next(i)) {
        // 每一个list节点都是一个Class__class指针
        Class_ curr = classes->nth(i);
        curr->semant();
    }

    /* some semantic analysis code may go here */

    if (classtable->errors()) {
	cerr << "Compilation halted due to static semantic errors." << endl;
	exit(1);
    }
}


