
//**************************************************************
//
// Code generator SKELETON
//
// Read the comments carefully. Make sure to
//    initialize the base class tags in
//       `CgenClassTable::CgenClassTable'
//
//    Add the label for the dispatch tables to
//       `IntEntry::code_def'
//       `StringEntry::code_def'
//       `BoolConst::code_def'
//
//    Add code to emit everyting else that is needed
//       in `CgenClassTable::code'
//
//
// The files as provided will produce code to begin the code
// segments, declare globals, and emit constants.  You must
// fill in the rest.
//
//**************************************************************
/*mycode begin*/
#include <vector>
#include <stack>
#include <unordered_map>
#include <algorithm>
/*mycode end*/

#include "cgen.h"
#include "cgen_gc.h"

extern void emit_string_constant(ostream& str, char *s);
extern int cgen_debug;

/*mycode begin*/
// 定义全局变量
CgenClassTable* global_class_table= nullptr;
Symbol global_self_type;
/*mycode end*/

//
// Three symbols from the semantic analyzer (semant.cc) are used.
// If e : No_type, then no code is generated for e.
// Special code is generated for new SELF_TYPE.
// The name "self" also generates code different from other references.
//
//////////////////////////////////////////////////////////////////////
//
// Symbols
//
// For convenience, a large number of symbols are predefined here.
// These symbols include the primitive type and method names, as well
// as fixed names used by the runtime system.
//
//////////////////////////////////////////////////////////////////////
Symbol 
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

static char *gc_init_names[] =
  { "_NoGC_Init", "_GenGC_Init", "_ScnGC_Init" };
static char *gc_collect_names[] =
  { "_NoGC_Collect", "_GenGC_Collect", "_ScnGC_Collect" };


//  BoolConst is a class that implements code generation for operations
//  on the two booleans, which are given global names here.
BoolConst falsebool(FALSE);
BoolConst truebool(TRUE);

//*********************************************************
//
// Define method for code generation
//
// This is the method called by the compiler driver
// `cgtest.cc'. cgen takes an `ostream' to which the assembly will be
// emmitted, and it passes this and the class list of the
// code generator tree to the constructor for `CgenClassTable'.
// That constructor performs all of the work of the code
// generator.
//
//*********************************************************

void program_class::cgen(ostream &os) 
{
  // spim wants comments to start with '#'
  os << "# start of generated code\n";

  initialize_constants();
  CgenClassTable *codegen_classtable = new CgenClassTable(classes,os);

  os << "\n# end of generated code\n";
}


//////////////////////////////////////////////////////////////////////////////
//
//  emit_* procedures
//
//  emit_X  writes code for operation "X" to the output stream.
//  There is an emit_X for each opcode X, as well as emit_ functions
//  for generating names according to the naming conventions (see emit.h)
//  and calls to support functions defined in the trap handler.
//
//  Register names and addresses are passed as strings.  See `emit.h'
//  for symbolic names you can use to refer to the strings.
//
//////////////////////////////////////////////////////////////////////////////

static void emit_load(char *dest_reg, int offset, char *source_reg, ostream& s)
{
  s << LW << dest_reg << " " << offset * WORD_SIZE << "(" << source_reg << ")" 
    << endl;
}

static void emit_store(char *source_reg, int offset, char *dest_reg, ostream& s)
{
  s << SW << source_reg << " " << offset * WORD_SIZE << "(" << dest_reg << ")"
      << endl;
}

static void emit_load_imm(char *dest_reg, int val, ostream& s)
{ s << LI << dest_reg << " " << val << endl; }

static void emit_load_address(char *dest_reg, char *address, ostream& s)
{ s << LA << dest_reg << " " << address << endl; }

static void emit_partial_load_address(char *dest_reg, ostream& s)
{ s << LA << dest_reg << " "; }

static void emit_load_bool(char *dest, const BoolConst& b, ostream& s)
{
  emit_partial_load_address(dest,s);
  b.code_ref(s);
  s << endl;
}

static void emit_load_string(char *dest, StringEntry *str, ostream& s)
{
  emit_partial_load_address(dest,s);
  str->code_ref(s);
  s << endl;
}

static void emit_load_int(char *dest, IntEntry *i, ostream& s)
{
  emit_partial_load_address(dest,s);
  i->code_ref(s);
  s << endl;
}

static void emit_move(char *dest_reg, char *source_reg, ostream& s)
{ s << MOVE << dest_reg << " " << source_reg << endl; }

static void emit_neg(char *dest, char *src1, ostream& s)
{ s << NEG << dest << " " << src1 << endl; }

static void emit_add(char *dest, char *src1, char *src2, ostream& s)
{ s << ADD << dest << " " << src1 << " " << src2 << endl; }

static void emit_addu(char *dest, char *src1, char *src2, ostream& s)
{ s << ADDU << dest << " " << src1 << " " << src2 << endl; }

static void emit_addiu(char *dest, char *src1, int imm, ostream& s)
{ s << ADDIU << dest << " " << src1 << " " << imm << endl; }

static void emit_div(char *dest, char *src1, char *src2, ostream& s)
{ s << DIV << dest << " " << src1 << " " << src2 << endl; }

static void emit_mul(char *dest, char *src1, char *src2, ostream& s)
{ s << MUL << dest << " " << src1 << " " << src2 << endl; }

static void emit_sub(char *dest, char *src1, char *src2, ostream& s)
{ s << SUB << dest << " " << src1 << " " << src2 << endl; }

static void emit_sll(char *dest, char *src1, int num, ostream& s)
{ s << SLL << dest << " " << src1 << " " << num << endl; }

static void emit_jalr(char *dest, ostream& s)
{ s << JALR << "\t" << dest << endl; }

static void emit_jal(char *address,ostream &s)
{ s << JAL << address << endl; }

static void emit_return(ostream& s)
{ s << RET << endl; }

static void emit_gc_assign(ostream& s)
{ s << JAL << "_GenGC_Assign" << endl; }

static void emit_disptable_ref(Symbol sym, ostream& s)
{  s << sym << DISPTAB_SUFFIX; }

static void emit_init_ref(Symbol sym, ostream& s)
{ s << sym << CLASSINIT_SUFFIX; }

static void emit_label_ref(int l, ostream &s)
{ s << "label" << l; }

static void emit_protobj_ref(Symbol sym, ostream& s)
{ s << sym << PROTOBJ_SUFFIX; }

static void emit_method_ref(Symbol classname, Symbol methodname, ostream& s)
{ s << classname << METHOD_SEP << methodname; }

static void emit_label_def(int l, ostream &s)
{
  emit_label_ref(l,s);
  s << ":" << endl;
}

static void emit_beqz(char *source, int label, ostream &s)
{
  s << BEQZ << source << " ";
  emit_label_ref(label,s);
  s << endl;
}

static void emit_beq(char *src1, char *src2, int label, ostream &s)
{
  s << BEQ << src1 << " " << src2 << " ";
  emit_label_ref(label,s);
  s << endl;
}

static void emit_bne(char *src1, char *src2, int label, ostream &s)
{
  s << BNE << src1 << " " << src2 << " ";
  emit_label_ref(label,s);
  s << endl;
}

static void emit_bleq(char *src1, char *src2, int label, ostream &s)
{
  s << BLEQ << src1 << " " << src2 << " ";
  emit_label_ref(label,s);
  s << endl;
}

static void emit_blt(char *src1, char *src2, int label, ostream &s)
{
  s << BLT << src1 << " " << src2 << " ";
  emit_label_ref(label,s);
  s << endl;
}

static void emit_blti(char *src1, int imm, int label, ostream &s)
{
  s << BLT << src1 << " " << imm << " ";
  emit_label_ref(label,s);
  s << endl;
}

static void emit_bgti(char *src1, int imm, int label, ostream &s)
{
  s << BGT << src1 << " " << imm << " ";
  emit_label_ref(label,s);
  s << endl;
}

static void emit_branch(int l, ostream& s)
{
  s << BRANCH;
  emit_label_ref(l,s);
  s << endl;
}

//
// Push a register on the stack. The stack grows towards smaller addresses.
//
static void emit_push(char *reg, ostream& str)
{
  emit_store(reg,0,SP,str);
  emit_addiu(SP,SP,-4,str);
}

//
// Fetch the integer value in an Int object.
// Emits code to fetch the integer value of the Integer object pointed
// to by register source into the register dest
//
static void emit_fetch_int(char *dest, char *source, ostream& s)
{ emit_load(dest, DEFAULT_OBJFIELDS, source, s); }

//
// Emits code to store the integer value contained in register source
// into the Integer object pointed to by dest.
//
static void emit_store_int(char *source, char *dest, ostream& s)
{ emit_store(source, DEFAULT_OBJFIELDS, dest, s); }


static void emit_test_collector(ostream &s)
{
  emit_push(ACC, s);
  emit_move(ACC, SP, s); // stack end
  emit_move(A1, ZERO, s); // allocate nothing
  s << JAL << gc_collect_names[cgen_Memmgr] << endl;
  emit_addiu(SP,SP,4,s);
  emit_load(ACC,0,SP,s);
}

static void emit_gc_check(char *source, ostream &s)
{
  if (source != (char*)A1) emit_move(A1, source, s);
  s << JAL << "_gc_check" << endl;
}


///////////////////////////////////////////////////////////////////////////////
//
// coding strings, ints, and booleans
//
// Cool has three kinds of constants: strings, ints, and booleans.
// This section defines code generation for each type.
//
// All string constants are listed in the global "stringtable" and have
// type StringEntry.  StringEntry methods are defined both for String
// constant definitions and references.
//
// All integer constants are listed in the global "inttable" and have
// type IntEntry.  IntEntry methods are defined for Int
// constant definitions and references.
//
// Since there are only two Bool values, there is no need for a table.
// The two booleans are represented by instances of the class BoolConst,
// which defines the definition and reference methods for Bools.
//
///////////////////////////////////////////////////////////////////////////////

//
// Strings
//
void StringEntry::code_ref(ostream& s)
{
  s << STRCONST_PREFIX << index;
}

//
// Emit code for a constant String.
// You should fill in the code naming the dispatch table.
//

void StringEntry::code_def(ostream& s, int stringclasstag)
{
  IntEntryP lensym = inttable.add_int(len);

  // Add -1 eye catcher
  s << WORD << "-1" << endl;

  code_ref(s);  s  << LABEL                                             // label
      << WORD << stringclasstag << endl                                 // tag
      << WORD << (DEFAULT_OBJFIELDS + STRING_SLOTS + (len+4)/4) << endl // size
      << WORD;


 /***** Add dispatch information for class String ******/
      /** 我的代码开始 */
      Symbol string  = idtable.lookup_string(STRINGNAME);
      emit_disptable_ref(string, s);
      /** 我的代码结束 */

      s << endl;                                              // dispatch table
      s << WORD;  lensym->code_ref(s);  s << endl;            // string length
  emit_string_constant(s,str);                                // ascii string
  s << ALIGN;                                                 // align to word
}

//
// StrTable::code_string
// Generate a string object definition for every string constant in the 
// stringtable.
//
void StrTable::code_string_table(ostream& s, int stringclasstag)
{  
  for (List<StringEntry> *l = tbl; l; l = l->tl())
    l->hd()->code_def(s,stringclasstag);
}

//
// Ints
//
void IntEntry::code_ref(ostream &s)
{
  s << INTCONST_PREFIX << index;
}

//
// Emit code for a constant Integer.
// You should fill in the code naming the dispatch table.
//

void IntEntry::code_def(ostream &s, int intclasstag)
{
  // Add -1 eye catcher
  s << WORD << "-1" << endl;

  code_ref(s);  s << LABEL                                // label
      << WORD << intclasstag << endl                      // class tag
      << WORD << (DEFAULT_OBJFIELDS + INT_SLOTS) << endl  // object size
      << WORD; 

 /***** Add dispatch information for class Int ******/
      /** 我的代码开始 */
      Symbol integer = idtable.lookup_string(INTNAME);
      emit_disptable_ref(integer, s);
      /** 我的代码结束 */

      s << endl;                                          // dispatch table
      s << WORD << str << endl;                           // integer value
}


//
// IntTable::code_string_table
// Generate an Int object definition for every Int constant in the
// inttable.
//
void IntTable::code_string_table(ostream &s, int intclasstag)
{
  for (List<IntEntry> *l = tbl; l; l = l->tl())
    l->hd()->code_def(s,intclasstag);
}


//
// Bools
//
BoolConst::BoolConst(int i) : val(i) { assert(i == 0 || i == 1); }

void BoolConst::code_ref(ostream& s) const
{
  s << BOOLCONST_PREFIX << val;
}
  
//
// Emit code for a constant Bool.
// You should fill in the code naming the dispatch table.
//

void BoolConst::code_def(ostream& s, int boolclasstag)
{
  // Add -1 eye catcher
  s << WORD << "-1" << endl;

  code_ref(s);  s << LABEL                                  // label
      << WORD << boolclasstag << endl                       // class tag
      << WORD << (DEFAULT_OBJFIELDS + BOOL_SLOTS) << endl   // object size
      << WORD;

 /***** Add dispatch information for class Bool ******/
      /** 我的代码开始 */
      Symbol boolc   = idtable.lookup_string(BOOLNAME);
      emit_disptable_ref(boolc, s);
      /** 我的代码结束 */

      s << endl;                                            // dispatch table
      s << WORD << val << endl;                             // value (0 or 1)
}

//////////////////////////////////////////////////////////////////////////////
//
//  CgenClassTable methods
//
//////////////////////////////////////////////////////////////////////////////

//***************************************************
//
//  Emit code to start the .data segment and to
//  declare the global names.
//
//***************************************************

void CgenClassTable::code_global_data()
{
  Symbol main    = idtable.lookup_string(MAINNAME);
  Symbol string  = idtable.lookup_string(STRINGNAME);
  Symbol integer = idtable.lookup_string(INTNAME);
  Symbol boolc   = idtable.lookup_string(BOOLNAME);

  str << "\t.data\n" << ALIGN;
  //
  // The following global names must be defined first.
  //
  str << GLOBAL << CLASSNAMETAB << endl;
  str << GLOBAL; emit_protobj_ref(main,str);    str << endl;
  str << GLOBAL; emit_protobj_ref(integer,str); str << endl;
  str << GLOBAL; emit_protobj_ref(string,str);  str << endl;
  str << GLOBAL; falsebool.code_ref(str);  str << endl;
  str << GLOBAL; truebool.code_ref(str);   str << endl;
  str << GLOBAL << INTTAG << endl;
  str << GLOBAL << BOOLTAG << endl;
  str << GLOBAL << STRINGTAG << endl;

  //
  // We also need to know the tag of the Int, String, and Bool classes
  // during code generation.
  //
  str << INTTAG << LABEL
      << WORD << intclasstag << endl;
  str << BOOLTAG << LABEL 
      << WORD << boolclasstag << endl;
  str << STRINGTAG << LABEL 
      << WORD << stringclasstag << endl;    
}


//***************************************************
//
//  Emit code to start the .text segment and to
//  declare the global names.
//
//***************************************************

void CgenClassTable::code_global_text()
{
  str << GLOBAL << HEAP_START << endl
      << HEAP_START << LABEL 
      << WORD << 0 << endl
      << "\t.text" << endl
      << GLOBAL;
  emit_init_ref(idtable.add_string("Main"), str);
  str << endl << GLOBAL;
  emit_init_ref(idtable.add_string("Int"),str);
  str << endl << GLOBAL;
  emit_init_ref(idtable.add_string("String"),str);
  str << endl << GLOBAL;
  emit_init_ref(idtable.add_string("Bool"),str);
  str << endl << GLOBAL;
  emit_method_ref(idtable.add_string("Main"), idtable.add_string("main"), str);
  str << endl;
}

void CgenClassTable::code_bools(int boolclasstag)
{
  falsebool.code_def(str,boolclasstag);
  truebool.code_def(str,boolclasstag);
}

void CgenClassTable::code_select_gc()
{
  //
  // Generate GC choice constants (pointers to GC functions)
  //
  str << GLOBAL << "_MemMgr_INITIALIZER" << endl;
  str << "_MemMgr_INITIALIZER:" << endl;
  str << WORD << gc_init_names[cgen_Memmgr] << endl;
  str << GLOBAL << "_MemMgr_COLLECTOR" << endl;
  str << "_MemMgr_COLLECTOR:" << endl;
  str << WORD << gc_collect_names[cgen_Memmgr] << endl;
  str << GLOBAL << "_MemMgr_TEST" << endl;
  str << "_MemMgr_TEST:" << endl;
  str << WORD << (cgen_Memmgr_Test == GC_TEST) << endl;
}


//********************************************************
//
// Emit code to reserve space for and initialize all of
// the constants.  Class names should have been added to
// the string table (in the supplied code, is is done
// during the construction of the inheritance graph), and
// code for emitting string constants as a side effect adds
// the string's length to the integer table.  The constants
// are emmitted by running through the stringtable and inttable
// and producing code for each entry.
//
//********************************************************

void CgenClassTable::code_constants()
{
  //
  // Add constants that are required by the code generator.
  //
  stringtable.add_string("");
  inttable.add_string("0");

  stringtable.code_string_table(str,stringclasstag);
  inttable.code_string_table(str,intclasstag);
  code_bools(boolclasstag);
}


CgenClassTable::CgenClassTable(Classes classes, ostream& s) : nds(NULL) , str(s)
{
   enterscope();
   if (cgen_debug) cout << "Building CgenClassTable" << endl;
   install_basic_classes();
   install_classes(classes);
   build_inheritance_tree();

   /** 我的代码开始 */
   stringclasstag = get_class_tag(Str);
   intclasstag = get_class_tag(Int);
   boolclasstag = get_class_tag(Bool);
   global_class_table = this;
   /** 我的代码结束 */

   code();
   exitscope();
}

void CgenClassTable::install_basic_classes()
{

// The tree package uses these globals to annotate the classes built below.
  //curr_lineno  = 0;
  Symbol filename = stringtable.add_string("<basic class>");

//
// A few special class names are installed in the lookup table but not
// the class list.  Thus, these classes exist, but are not part of the
// inheritance hierarchy.
// No_class serves as the parent of Object and the other special classes.
// SELF_TYPE is the self class; it cannot be redefined or inherited.
// prim_slot is a class known to the code generator.
//
  addid(No_class,
	new CgenNode(class_(No_class,No_class,nil_Features(),filename),
			    Basic,this));
  addid(SELF_TYPE,
	new CgenNode(class_(SELF_TYPE,No_class,nil_Features(),filename),
			    Basic,this));
  addid(prim_slot,
	new CgenNode(class_(prim_slot,No_class,nil_Features(),filename),
			    Basic,this));

// 
// The Object class has no parent class. Its methods are
//        cool_abort() : Object    aborts the program
//        type_name() : Str        returns a string representation of class name
//        copy() : SELF_TYPE       returns a copy of the object
//
// There is no need for method bodies in the basic classes---these
// are already built in to the runtime system.
//
  install_class(
   new CgenNode(
    class_(Object, 
	   No_class,
	   append_Features(
           append_Features(
           single_Features(method(cool_abort, nil_Formals(), Object, no_expr())),
           single_Features(method(type_name, nil_Formals(), Str, no_expr()))),
           single_Features(method(copy, nil_Formals(), SELF_TYPE, no_expr()))),
	   filename),
    Basic,this));

// 
// The IO class inherits from Object. Its methods are
//        out_string(Str) : SELF_TYPE          writes a string to the output
//        out_int(Int) : SELF_TYPE               "    an int    "  "     "
//        in_string() : Str                    reads a string from the input
//        in_int() : Int                         "   an int     "  "     "
//
   install_class(
    new CgenNode(
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
	   filename),	    
    Basic,this));

//
// The Int class has no methods and only a single attribute, the
// "val" for the integer. 
//
   install_class(
    new CgenNode(
     class_(Int, 
	    Object,
            single_Features(attr(val, prim_slot, no_expr())),
	    filename),
     Basic,this));

//
// Bool also has only the "val" slot.
//
    install_class(
     new CgenNode(
      class_(Bool, Object, single_Features(attr(val, prim_slot, no_expr())),filename),
      Basic,this));

//
// The class Str has a number of slots and operations:
//       val                                  ???
//       str_field                            the string itself
//       length() : Int                       length of the string
//       concat(arg: Str) : Str               string concatenation
//       substr(arg: Int, arg2: Int): Str     substring
//       
   install_class(
    new CgenNode(
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
	     filename),
        Basic,this));

}

// CgenClassTable::install_class
// CgenClassTable::install_classes
//
// install_classes enters a list of classes in the symbol table.
//
void CgenClassTable::install_class(CgenNodeP nd)
{
  Symbol name = nd->get_name();

  if (probe(name))
    {
      return;
    }

  // The class name is legal, so add it to the list of classes
  // and the symbol table.
  nds = new List<CgenNode>(nd,nds);
  addid(name,nd);
}

void CgenClassTable::install_classes(Classes cs)
{
  for(int i = cs->first(); cs->more(i); i = cs->next(i))
    install_class(new CgenNode(cs->nth(i),NotBasic,this));
}

//
// CgenClassTable::build_inheritance_tree
//
void CgenClassTable::build_inheritance_tree()
{
  for(List<CgenNode> *l = nds; l; l = l->tl())
      set_relations(l->hd());
}

//
// CgenClassTable::set_relations
//
// Takes a CgenNode and locates its, and its parent's, inheritance nodes
// via the class table.  Parent and child pointers are added as appropriate.
//
void CgenClassTable::set_relations(CgenNodeP nd)
{
  CgenNode *parent_node = probe(nd->get_parent());
  nd->set_parentnd(parent_node);
  parent_node->add_child(nd);
}

void CgenNode::add_child(CgenNodeP n)
{
  children = new List<CgenNode>(n,children);
}

void CgenNode::set_parentnd(CgenNodeP p)
{
  assert(parentnd == NULL);
  assert(p != NULL);
  parentnd = p;
}


/** 我的代码开始 */
//  获取某个类节点所有的父节点，包括自身
static std::stack<CgenNodeP> get_parent_node(CgenNodeP node_ptr){
  std::stack<CgenNodeP> node_stack;
  while(node_ptr->get_name() != No_class){
    node_stack.push(node_ptr);
    node_ptr = node_ptr->get_parentnd();
  }
  return node_stack;
}

int CgenClassTable::get_class_tag(Symbol name){
  for(List<CgenNode> *l = nds; l; l = l->tl()){
    CgenNode* node_ptr = l->hd();
    // Symbl是一个指向entry的指针
    if(node_ptr->get_name() == name){
      return list_length(l) - 1;
    }
  }
  return -1;
}

// 生成class_name表
void CgenClassTable::code_class_name_tab(){
  str << CLASSNAMETAB << LABEL;
  std::stack<CgenNodeP> node_stack;
  for(List<CgenNode> *l = nds; l; l = l->tl()){
    node_stack.push(l->hd());
  }
  while(!node_stack.empty()){
    CgenNodeP node = node_stack.top();
    node_stack.pop();
    str << WORD;
    stringtable.lookup_string(node->get_name()->get_string())->code_ref(str);
    str << endl;
  }
}

// 生成class的pro obj和init方法表格
void CgenClassTable::code_class_obj_tab(){
  str << CLASSOBJTAB << LABEL;
  std::stack<CgenNodeP> node_stack;
  for(List<CgenNode> *l = nds; l; l = l->tl()){
    node_stack.push(l->hd());
  }
  while(!node_stack.empty()){
    CgenNodeP node = node_stack.top();
    node_stack.pop();
    str << WORD;
    emit_protobj_ref(node->get_name(), str);
    str << endl;
    str << WORD;
    emit_init_ref(node->get_name(), str);
    str << endl;
  }
}

// 怎么设计这个proj的layout关键在于copy或者init怎么使用？并且要保证后续的引用是正确的
// 继承时重新定义的同名属性怎么处理，parser和semant报错
// 这里是ID : TYPE [ <- expr ]不给定expr的值的
void CgenClassTable::code_prototype_obj(){
  for(List<CgenNode> *l = nds; l; l = l->tl()){
    // 生成这个类genNode的pro_obj
    std::stack<CgenNodeP> node_stack = get_parent_node(l->hd());
    std::vector<Symbol> type_decls;
    while(!node_stack.empty()){
      // 找到这个类所有feature中的formal，即类成员变量
      CgenNodeP node_ptr = node_stack.top();
      node_stack.pop();
      Features features = node_ptr->features;
      for(int i = features->first(); features->more(i); i = features->next(i)){
        Feature feature = features->nth(i);
        attr_class* attr= dynamic_cast<attr_class*>(feature);
        if(attr){
          // 找到是attr的feature
          type_decls.push_back(attr->type_decl);
        }
      }
    }

    Symbol name = l->hd()->get_name();
    int classtag = list_length(l) - 1;
    int obj_size = DEFAULT_OBJFIELDS + type_decls.size();

    // 生成pro_obj代码
    // Add -1 eye catcher
    str << WORD << "-1" << endl;
    emit_protobj_ref(name, str); str << LABEL;
    str << WORD << classtag << endl;
    str << WORD << obj_size << endl;
    str << WORD; emit_disptable_ref(name, str); str << endl; 
    for(auto type_decl : type_decls){
      str << WORD;
      if(type_decl == Str){
        // 地址指向的是一样的，idtable的add_string函数回西安搜索判断是否存在。
        // 这也说明了parser和semant阶段的共用变量，怎么做到的？
        // str << "type_decl" <<(void*)type_decl << ", Str: " << (void*)Str;
        stringtable.lookup_string("")->code_ref(str);
      }else if(type_decl == Bool){
        falsebool.code_ref(str);
      }else if(type_decl == Int){
        inttable.lookup_string("0")->code_ref(str);
      }else{
        str << 0;
      }
      str << endl; 
    }
  }
}

static void get_methods_info(CgenNode* node, std::unordered_map<Symbol, Symbol>& method_map, std::vector<Symbol>& method_names){
  std::stack<CgenNodeP> node_stack = get_parent_node(node);
  // 可能需要重写父类的方法
  while(!node_stack.empty()){
      CgenNodeP current_node = node_stack.top();
      node_stack.pop();
      Features features = current_node->features;
      for(int i = features->first(); features->more(i); i = features->next(i)){
        Feature feature = features->nth(i);
        method_class* method= dynamic_cast<method_class*>(feature);
        if(method){
         if (method_map.find(method->name) == method_map.end()) {
            method_names.push_back(method->name);
          }
          method_map[method->name] = current_node->get_name();
        }
      }
    }
}

// 为每个类建立一个dispatch_table
void CgenClassTable::code_dispath_tabs(){
  for(List<CgenNode> *l = nds; l; l = l->tl()){
    CgenNodeP node = l->hd();
    emit_disptable_ref(node->get_name(), str); str << LABEL;
    // 生成这个类所有方法的表格
    std::unordered_map<Symbol, Symbol> method_map;
    std::vector<Symbol> method_names;
    get_methods_info(node, method_map, method_names);
    for (const auto& method_name : method_names) {
      str << WORD;
      emit_method_ref(method_map[method_name], method_name, str);
      str << endl; 
    }
  }
}

// 函数定义中，为body表达式生成代码前的代码
// 对于runtime调用main函数是怎么样的？是否存在不一致，会不会又影响。--> 有影响，需要变更,fram修改后如下
//  (参数an，...,参数a1)，[存放调用这个函数的$fp], [调用者的对象s0] [返回调用者代码的地址], 方括号表示应该存入此值，但是还在寄存器中
// 如果是这样的，那么在函数调用时需要push fp，push s0，并且把a0已移动到s0当中  --> 修改为定义时push。调用时s0暂时不能变
static void emit_func_def_begin(ostream &s){
  emit_addiu(SP,SP,-12,s);
  emit_store(FP,3,SP,s);
  emit_store(SELF,2,SP,s);
  emit_store(RA,1,SP,s);
  emit_addiu(FP,SP,12,s);
  emit_move(SELF, ACC, s);
}


// 函数body结束后恢复栈
static void emit_func_def_end(ostream &s, int param_num){
  // 恢复ra，s0 和fp
  emit_load(FP,3,SP,s);
  emit_load(SELF,2,SP,s);
  emit_load(RA,1,SP,s);
  emit_addiu(SP,SP,12 + 4*(param_num),s);
  emit_return(s);
}

// 在函数调用参数如栈后，跳转前需要完成的操作
// 将fp，s0压栈。此时a0中是需要跳转的类，移动到s0当中   --> 这个函数修改为空
// static void emit_func_ref_after_param(ostream &s){
//   // emit_push(FP, s);
//   // emit_push(SELF, s);
//   // emit_move(SELF, ACC, s);
// }

static int get_cgen_attr_num(CgenNode* node, attr_class* attr)
{
  std::stack<CgenNodeP> node_stack = get_parent_node(node);
  int size = 0;
  while(!node_stack.empty()){
    CgenNodeP current_node = node_stack.top();
    node_stack.pop();
    Features features = current_node->features;
    for(int i = features->first(); features->more(i); i = features->next(i)){
      Feature feature = features->nth(i);
      attr_class* current_attr= dynamic_cast<attr_class*>(feature);
      if(current_attr){
        size ++;
        if(node == current_node && attr == current_attr){
          return size;
        }
      }
    }
  }
  return size;
}

// 生成类的init函数
// init可以看作没有参数的调用
// Todo:!!假设调用时帧已经准备好，s0保存在帧中。新的s0也已经给定。todo，需要验证
// Todo:!!且init函数不考虑返回值
void CgenClassTable::code_class_init(){
  for(List<CgenNode> *l = nds; l; l = l->tl())
  {
    CgenNodeP node = l->hd();
    emit_init_ref(node->get_name(), str); str << LABEL;

    emit_func_def_begin(str);

    // 找到所有父类，先执行它的init函数
    auto parent_node = node->get_parentnd();
    if((parent_node->name != No_class)){
      // emit_func_ref_after_param(str);
      // 进行函数调用时，s0可以不变。子类也可以看作是父类
      str << JAL; emit_init_ref(parent_node->get_name(), str); str << endl;
    }
    
    // Todo:!! 验证init函数中有函数调用形式
    global_self_type = node->name;
    // 处理自身的init方法
    Features features = node->features;
    for(int i = features->first(); features->more(i); i = features->next(i))
    {
      Feature feature = features->nth(i);
      attr_class* attr= dynamic_cast<attr_class*>(feature);
      if(attr != nullptr)
      {
        if(dynamic_cast<no_expr_class*>(attr->init) == nullptr)
        {
          // !!注意此处有可能设计init可以引用的变量时哪些
          attr->init->code(str);
          // 将表达式初始化后的值，复制到对象的相应位置
          emit_store(ACC, DEFAULT_OBJFIELDS + get_cgen_attr_num(node, attr) - 1, SELF, str);
        }
      }
    }

    emit_func_def_end(str, 0);
  }
}

// 生成类的函数
void CgenClassTable::code_class_method()
{
  for(List<CgenNode> *l = nds; l; l = l->tl())
  {
    CgenNodeP node = l->hd();
    if(node->basic())
    {
      continue;
    }

    // 在执行函数体的时候，SELF_TYPE就是指的包含这个的类
    global_self_type = node->name;
    Features features = node->features;
    for(int i = features->first(); features->more(i); i = features->next(i))
    {
      Feature feature = features->nth(i);
      method_class* method= dynamic_cast<method_class*>(feature);
      if(method != nullptr)
      {
        emit_method_ref(node->name ,method->name, str);
        str << LABEL;
        emit_func_def_begin(str);
        method->expr->code(str);
        emit_func_def_end(str, method->formals->len());
      }
    }
  }
}


CgenNodeP CgenClassTable::get_node_by_class(Symbol class_name){
  for(List<CgenNode> *l = nds; l; l = l->tl())
  {
    CgenNodeP node = l->hd();
    if(node->name == class_name){
      return node;
    }
  }
  return nullptr;
}

// 根据类名，函数名，找到在dispath table中的位置
int get_func_offset(Symbol class_name, Symbol func_name, CgenClassTable* global_class_table){
  auto node = global_class_table->get_node_by_class(class_name);
  std::unordered_map<Symbol, Symbol> method_map;
  std::vector<Symbol> method_names;
  get_methods_info(node, method_map, method_names);
  // method_names是按照循序存入的函数名
  auto it = std::find(method_names.begin(), method_names.end(), func_name);
  return (it != method_names.end()) ? std::distance(method_names.begin(), it) : -1;
}

/** 我的代码结束 */


void CgenClassTable::code()
{
  if (cgen_debug) cout << "coding global data" << endl;
  code_global_data();

  if (cgen_debug) cout << "choosing gc" << endl;
  code_select_gc();

  if (cgen_debug) cout << "coding constants" << endl;
  code_constants();

//                 Add your code to emit
//                   - prototype objects
//                   - class_nameTab
//                   - dispatch tables
//

  /** 我的代码开始 */
  code_class_name_tab();
  code_class_obj_tab();
  code_prototype_obj();
  code_dispath_tabs();
  /** 我的代码结束 */

  if (cgen_debug) cout << "coding global text" << endl;
  code_global_text();

//                 Add your code to emit
//                   - object initializer
//                   - the class methods
//                   - etc...

/** 我的代码开始 */
code_class_init();
code_class_method();
/** 我的代码结束 */

}


CgenNodeP CgenClassTable::root()
{
   return probe(Object);
}


///////////////////////////////////////////////////////////////////////
//
// CgenNode methods
//
///////////////////////////////////////////////////////////////////////

CgenNode::CgenNode(Class_ nd, Basicness bstatus, CgenClassTableP ct) :
   class__class((const class__class &) *nd),
   parentnd(NULL),
   children(NULL),
   basic_status(bstatus)
{ 
   stringtable.add_string(name->get_string());          // Add class name to string table
}


//******************************************************************
//
//   Fill in the following methods to produce code for the
//   appropriate expression.  You may add or remove parameters
//   as you wish, but if you do, remember to change the parameters
//   of the declarations in `cool-tree.h'  Sample code for
//   constant integers, strings, and booleans are provided.
//
//*****************************************************************

void assign_class::code(ostream &s) {
}

void static_dispatch_class::code(ostream &s) {
}

void dispatch_class::code(ostream &s) {
  /** 我的代码开始 */
  // 类成员变量和函数参数同名时，引用的是函数参数
  // 先计算参数表达式，再计算e0调用者的表达式
  // 最关键的是怎么引用栈内的变量，类里面的变量
  for(int i = actual->first(); actual->more(i); i = actual->next(i)){
    Expression expr = actual->nth(i);
    expr->code(s);
    // 此时结果在ACC中，压栈
    emit_push(ACC, s);
  }
  expr->code(s);
  // 完成寄存器保存，s0替换 --> ar变化，取消
  // emit_func_ref_after_param(s);
  // 查找特定的函数然后跳转，s0替换后
  // expr有特定的类型type。这个是语义分析时给定的。这个类型应该是实际类型或者其父类。
  // Todo：找到cool语言中type是实际的父类的时候
  Symbol class_name = expr->get_type();
  if(class_name == SELF_TYPE){
    class_name = global_self_type;
  }
  Symbol func_name = name;
  // 求函数在dispatch table中的便宜，从0开始，单位是1
  int func_offset = get_func_offset(class_name, func_name, global_class_table);
  // $a0偏移8个位置就是dispatch table pointer,这里应该可以使用ACC作为目标寄存器 --> 这里不能使用s0，使用ACC，ok
  emit_load(T1, 2, ACC, s);
  emit_load(T1, func_offset, T1, s);
  emit_jalr(T1, s);
  /** 我的代码结束 */
}

void cond_class::code(ostream &s) {
}

void loop_class::code(ostream &s) {
}

void typcase_class::code(ostream &s) {
}

void block_class::code(ostream &s) {
}

void let_class::code(ostream &s) {
}

void plus_class::code(ostream &s) {
}

void sub_class::code(ostream &s) {
}

void mul_class::code(ostream &s) {
}

void divide_class::code(ostream &s) {
}

void neg_class::code(ostream &s) {
}

void lt_class::code(ostream &s) {
}

void eq_class::code(ostream &s) {
}

void leq_class::code(ostream &s) {
}

void comp_class::code(ostream &s) {
}

void int_const_class::code(ostream& s)  
{
  //
  // Need to be sure we have an IntEntry *, not an arbitrary Symbol
  //
  emit_load_int(ACC,inttable.lookup_string(token->get_string()),s);
}

void string_const_class::code(ostream& s)
{
  emit_load_string(ACC,stringtable.lookup_string(token->get_string()),s);
}

void bool_const_class::code(ostream& s)
{
  emit_load_bool(ACC, BoolConst(val), s);
}

void new__class::code(ostream &s) {
}

void isvoid_class::code(ostream &s) {
}

void no_expr_class::code(ostream &s) {
}

void object_class::code(ostream &s) {
  // 这里使用名称还是类型，和semant有关。需要考虑是不是唯一
  if(name->equal_string("self", 4))
  {
    // 把当前对象的地址移动到$a0中
    emit_move(ACC, SELF, s);
  }
}


