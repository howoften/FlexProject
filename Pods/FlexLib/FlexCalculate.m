//
//  FlexCalculate.m
//  FlexLib
//
//  Created by liujiang on 2020/8/27.
//
#import "FlexCalculate.h"

double calculate(char *expression)
{
//    printf(">>>>>>>>>要计算 :%s\n", expression);
    eatspace(expression, ' ');
//    printf(">>>>>>>>>去空格后 :%s\n", expression);

//    int index = 0;
//    double value = get_number(expression, &index);
    double res = expression_analysis_addorsub(expression);
//    printf(">>>>>>>>>加法结果 :%f \n",res);
    return res;

}

//乘除法：str=算式 ； vptr_index=下标
double expression_analysis_mutordiv(char* str, int* vptr_index)
{
    double value = 0.0;
    value = get_number(str, vptr_index);
    while (1)
    {
        if (*(str + (*vptr_index)) == '*')//如果是乘号
        {
            (*vptr_index)++; //下标向前移动
            value *= get_number(str, vptr_index);//计算乘法
        }
        else if (*(str + (*vptr_index)) == '/') //如果是除号
        {
            (*vptr_index)++; //下标向前移动
            value /= get_number(str, vptr_index);//计算乘法
        }
        else
        {
            break;
        }
    }
    return value;
}


//加减法
double expression_analysis_addorsub(char* str)
{
    double value = 0.0;
    int index = 0;
    value = expression_analysis_mutordiv(str, &index);
    while (1)
    {
        char ch = *(str + index);
        index++;//循环遍历

        switch (ch)
        {
        case '\0':
            return value;
        case '+':
            value += expression_analysis_mutordiv(str, &index);
            break;
        case '-':
            value -= expression_analysis_mutordiv(str, &index);
            break;
        default:
            break;
        }

    }

}

//处理括号配对分析
char* bracket_analysis(char* str, int* vptr_index)
{
    char* pbarstr = NULL;
    int num = 0;//记录包含括号的对数
    int left_bar = *vptr_index;//左括号位置（下标）

    do
    {

        switch (*(str + (*vptr_index)))//处理括号字符
        {
            case '(':
                num++;
                break;
            case ')':
                if (num==0)
                {
                    (*(vptr_index))++;//移动到括号的后面
                    pbarstr = malloc(sizeof(char) * (*vptr_index - left_bar));
                    if (pbarstr != NULL)
                    {
                        strncpy(pbarstr, str + left_bar, *vptr_index - left_bar-1);//拷贝字符串
//                        printf("拆解：%s\n", pbarstr);
                        return pbarstr;
                    }
                    else
                    {
                        return NULL;
                    }
                    
                }
                else
                {
                    num--;
                }
                break;
            default:
                break;
        }
    } while (*(str + (*vptr_index)++) != '\0');//字符串没有结束，继续循环
    return NULL;
}

//获取数据  [参数：str=字符串 ；index=下标]
double get_number(char* str, int* vptr_index)
{
    double result = 0.0;
    int index = *vptr_index;

    //括号配对处理：

    while (*(str + index) == '(')
    {
        char* psubstr = NULL;//取出字符串
        *vptr_index = ++index;//下标跳到括号的后面
        psubstr = bracket_analysis(str, vptr_index);//获取括号中的字符串
        if (psubstr != NULL)
        {
            result = expression_analysis_addorsub(psubstr);
            free(psubstr);//释放内存
            psubstr = NULL;
        }
        return result;
    }

    /*---------------------------------------------------------------*/
    while (is_number(*(str + index)))
    {
        result = result * 10 + (str[index] - '0');//字符转数字
        index++;//下标向前
    }

    if (*(str + index) == '.')
    {
        double decimals = 1.0;
        while (is_number(*(str + ++index)))//循环到小数位后面的非数字位置
        {
            decimals /= 10;//小数
            result += decimals * (*(str + index) - '0');
        }
    }
    *vptr_index = index;//保存下标位置
    return result;
}

//判断字符是否是数字
int is_number(char ch)
{
    int flag = 0;
    if (ch >= '0' && ch <= '9')
    {
        flag = 1;
    }
    return flag;
}

void space(char* str)
{
    int i = 0;
    int j = 0;
    while (str[i] != '\0')
    {
        str[i] = str[j];
        if (str[i] != ' ')
        {
            i++; //有条件的下标前进
        }
        j++; //一定要前进
    }

    /*
     //简化写法
    while (str[i] = str[j++]!='\0')
    {
        if (str[i] != ' ')
        {
            i++;
        }
    }

    */

}

/*
 去掉字符串中指定字符

*/
void eatspace(char* str, char ch)
{
    char* vptr1 = str;
    char* vptr2 = str;

    while (*vptr1 != '\0')
    {
        *vptr1 = *vptr2;
        if (*vptr1 != ch)
        {
            vptr1++;
        }
        vptr2++;
    }

    /*while (*vptr1=*(vptr2++)!='\0')
    {
        if (*vptr1 != ch)
        {
            vptr1++;
        }
    }*/
}
