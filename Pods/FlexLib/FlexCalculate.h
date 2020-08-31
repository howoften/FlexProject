//
//  FlexCalculate.h
//  FlexLib
//
//  Created by liujiang on 2020/8/27.
//
#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#include<stdlib.h>
#include<string.h>


//去空格 下标方法
void space(char* str);

//去空格或任意字符 ，指针方法
void eatspace(char* str, char ch);

//判断字符是否是数字  0：是 |  1：否
int is_number(char ch);

//获取数据  [参数：str=字符串 ；index=下标]
double get_number(char* str, int* vptr_index);

//expression_analysis  算式分析：加减发
double expression_analysis_addorsub(char* str);
//expression_analysis  算式分析：乘除发
double expression_analysis_mutordiv(char* str, int* vptr_index);

//处理括号配对 算式分析
char* bracket_analysis(char* str, int* vptr_index);

double calculate(char *expression);
