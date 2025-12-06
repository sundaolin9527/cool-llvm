/*
 *  The scanner definition for COOL.
 */

/*
 *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
 *  output, so headers and global definitions are placed here to be visible
 * to the code in the file.  Don't remove anything that was here initially
 */
%{
#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>

/* The compiler assumes these identifiers. */
#define yylval cool_yylval
#define yylex  cool_yylex

/* Max size of string constants */
#define MAX_STR_CONST 1025
#define YY_NO_UNPUT   /* keep g++ happy */

extern FILE *fin; /* we read from this file */

/* define YY_INPUT so we read from the FILE fin:
 * This change makes it possible to use this scanner in
 * the Cool compiler.
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
	if ( (result = fread( (char*)buf, sizeof(char), max_size, fin)) < 0) \
		YY_FATAL_ERROR( "read() in flex scanner failed");

char string_buf[MAX_STR_CONST]; /* to assemble string constants */
char *string_buf_ptr;

extern int curr_lineno;
extern int verbose_flag;

extern YYSTYPE cool_yylval;
int comment_layer = 0;
int string_err = 0;

/*
 *  Add Your own definitions here
 */

%}

/*编译问题，参考https://stackoverflow.com/questions/1480138/undefined-reference-to-yylex*/
%option noyywrap

/*
 * Define names for regular expressions here.
 */

DARROW          =>
ASSIGN          <-
LE              <=
/*没有>,没有匹配的正常规则的返回报错*/
SYMBOL          "+"|"-"|"*"|"/"|"~"|"<"|"<="|"="|"("|")"|","|"."|"{"|"}"|":"|";"|"@"
INTERGERS       [0-9]+
TYPEID          [A-Z][0-9a-zA-Z_]*
OBJECTID        [a-z][0-9a-zA-Z_]*
%x QUOTE
%x COMMENTS

%%

 /*
  *  Nested comments
  */


 /*
  *  The multiple-character operators.
  */
{DARROW}		{ return (DARROW); }
{ASSIGN}    {return ASSIGN;}
{LE}        {return LE;}
{SYMBOL}    {return *yytext;}

 /*
  * Keywords are case-insensitive except for the values true and false,
  * which must begin with a lower-case letter.
  */
 /*关键字*/
(?i:class) { return CLASS; }
(?i:else) { return ELSE; }
(?i:fi) { return FI; }
(?i:if) { return IF; }
(?i:in) { return IN; }
(?i:inherits) { return INHERITS; }
(?i:let) { return LET; }
(?i:loop) { return LOOP; }
(?i:pool) { return POOL; }
(?i:then) { return THEN; }
(?i:while) { return WHILE; }
(?i:case) { return CASE; }
(?i:esac) { return ESAC; }
(?i:of) { return OF; }
(?i:new) { return NEW; }
(?i:isvoid) { return ISVOID; }
(?i:not) { return NOT; }
t(?i:rue) {
  cool_yylval.boolean = 1;
  return BOOL_CONST;
}
f(?i:alse) {
  cool_yylval.boolean = 0;
  return BOOL_CONST;
}

 /*white space*/
(\n) {curr_lineno++;}
(" "|\r|\f|\t|\v) {}

 /*ID*/
{TYPEID} {
  cool_yylval.symbol = idtable.add_string(yytext);
  return TYPEID;
}
{OBJECTID} {
  cool_yylval.symbol = idtable.add_string(yytext);
  return OBJECTID;
}

 /*整数*/
{INTERGERS} {
  cool_yylval.symbol = idtable.add_string(yytext);
  return INT_CONST;
}



 /*
  *  String constants (C syntax)
  *  Escape sequence \c is accepted for all characters c. Except for 
  *  \n \t \b \f, the result is c.
  *
  */
  /*
  * string
  * \c表示c,（除了\b,\t,\n,\f表示一个转译的符号）
  * string结果不能包含'\0'。原始的\0根据上一条规则转换为0
  * 不能包含前面没有\符号的换行，\EOF不会匹配到\\.规则，后面会匹配到<<EOF>>规则
  */
(\") {
  string_buf_ptr = string_buf;
  BEGIN(QUOTE);
}
<QUOTE>(\") {
  BEGIN(INITIAL);
  if(string_err == 1) {
    string_err = 0;
  }else {
    if(string_buf_ptr-string_buf == MAX_STR_CONST) {
      yylval.error_msg = "String constant too long";
      return ERROR;
    }
    *string_buf_ptr = '\0';
    // add_string需要参数string包含\0,但添加到表格中的时候u不包含\0
    cool_yylval.symbol = stringtable.add_string(string_buf);
    return STR_CONST;
  }
}
<QUOTE>(\\b) {
  if(string_buf_ptr-string_buf <= MAX_STR_CONST) *string_buf_ptr++ = '\b';
}
<QUOTE>(\\t) {
  if(string_buf_ptr-string_buf <= MAX_STR_CONST) *string_buf_ptr++ = '\t';
}
<QUOTE>(\\n) {
  if(string_buf_ptr-string_buf <= MAX_STR_CONST) *string_buf_ptr++ = '\n';
}
<QUOTE>(\\f) {
  if(string_buf_ptr-string_buf <= MAX_STR_CONST) *string_buf_ptr++ = '\f';
}
<QUOTE>(\\\0) {
  // 这个错误处理需要把string当成仍然继续,并且只需要一个错误
  // BEGIN(INITIAL);
  if(string_err == 0) {
    string_err = 1;
    yylval.error_msg = "String contains escaped null character.";
    return ERROR;
  }
}
<QUOTE>(\\(.|\n)) {
  if(string_buf_ptr-string_buf <= MAX_STR_CONST) *string_buf_ptr++ = yytext[1];
}
<QUOTE>(\n) {
  BEGIN(INITIAL);
  if(string_err == 0) {
    yylval.error_msg = "Unterminated string constant";
    return ERROR;
  }
}
<QUOTE><<EOF>> {
  BEGIN(INITIAL);
  yylval.error_msg = "EOF in string constant";
  return ERROR;
}
<QUOTE>(\0) {
  if(string_err == 0) {
    string_err = 1;
    yylval.error_msg = "String contains null character.";
    return ERROR;
  }
}
<QUOTE>(.) {
  if(string_buf_ptr-string_buf <= MAX_STR_CONST) *string_buf_ptr++ = yytext[0];
}

  /*
  *注释形式1：以--开头，\n或者EOF结尾
  *注释形式2：(∗ . . . ∗)。可以嵌套
  */
(--[^\n]*\n) {curr_lineno++;}
(--[^\n]*) {
  // 不能直接显示添加EOF
  curr_lineno++;
}
<COMMENTS,INITIAL>("(*") {
  BEGIN(COMMENTS);
  comment_layer++;
}
<COMMENTS>("*)") {
  comment_layer--;
  if(comment_layer == 0) {
    BEGIN(INITIAL);
  }
}
<COMMENTS>(.) {
  // 应该可以使用多匹配字符来加速
}
<COMMENTS>(\n) {curr_lineno++;}
<COMMENTS><<EOF>> {
  BEGIN(INITIAL);
  yylval.error_msg = "EOF in comment";
  return ERROR;
}
("*)") {
  yylval.error_msg = "Unmatched *)";
  return ERROR;
}

 /*没有和前面匹配，返回错误*/
(.) {
  // yytextg指向哪里，生命周期->下一次调用会刷新
  yylval.error_msg = yytext;
  return ERROR;
}
%%
