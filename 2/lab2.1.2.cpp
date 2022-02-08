/*Abushaeva Diana PS-22/ Абушаева Диана ПС-22
© 2016 - 2021 GDB Online(https://www.onlinegdb.com/online_c++_compiler#)
24. Имеется  выражение  в  постфиксной  форме,   включающее 
обращение к функциям SIN, COS, EXP.  Переменные  заданы  одной 
строчной латинской буквой.  Запросить  значения  переменных  и 
вычислить выражение. Представить  его  в  инфиксной  форме  со 
скобками. Лишние скобки присутствовать не должны (11).
*/
#include <iostream>
#include <string>
#include <cmath>
#include <cstdio>
#include <math.h>

using namespace std;

struct St 
{
	string key;
	St *next;
};
void push(St *&p, string elem);  
string pop(St *&p);                  

void push(St *&p, string elem)  
{
	St *t = new St;
	t -> key = elem;
	t -> next = p; 
	p = t;
}

string pop(St *&p)            
{
    string pop1;
	St *t = p;
	pop1 = t -> key;
	p = p -> next;
	delete t;
	return pop1;
}


struct StInt 
{
	int key;
	StInt *next;
};
void pushInt(StInt *&p2, int elem);  
int popInt(StInt *&p2);                  

void pushInt(StInt *&p2, int elem)  
{
	StInt *t2 = new StInt;
	t2 -> key = elem;
	t2 -> next = p2; 
	p2 = t2;
}

int popInt(StInt *&p2)            
{
    int pop2;
	StInt *t2 = p2;
	pop2 = t2 -> key;
	p2 = p2 -> next;
	delete t2;
	return pop2;
}


int calc1(string a, int op1)
{
    int sum;
    if(a == "COS")
    {
        sum = cos(op1);
    };
    if(a == "SIN")
    {
        sum = sin(op1);
    };
    if(a == "EXP")
    {
        sum = exp(op1);
    };
    return sum;
}

int calc2(string a, int op1, int op2)
{
    int sum;
    if(a == "+")
    {
        sum = op2 + op1;
    };
    if(a == "-")
    {
        sum = op2 - op1;
    };
    if(a == "*")
    {
        sum = op2 * op1;
    };
    if(a == "/")
    {
        sum = op2 / op1;
    };
    if(a == "^")
    {
        sum = pow(op2, op1);
    };
    return sum;
}


int main()
{
    St stek;
    StInt stekInt, stekValue;
    
    const string action[8] = { "+", "-", "/", "*", "^", "EXP", "COS", "SIN"};
    
    bool flag1;
    int i, i1, flag2, flag3, value, op1, op2;
    string inStr, a, outStr, operand1, operand2;
    flag1 = true;
    
    while(flag1)
    {
        outStr = "";
        value = 0;
        cout<<"Please enter expresion: ";
        cin>>inStr;
        
        if(inStr == "")
        {
            outStr = "You don't enter expresion";
        }
        else
        {
            for(i = 0; i < inStr.length(); i++)
            {
                a = inStr[i];
        
                // flag2
    
                int flag2 = 0; // letter
        
                if(a == "+" || a == "-")
                {
                    flag2 = 1;
                };
        
                if(a == "*" || a == "/")
                {
                    flag2 = 2;
                };
        
                if(a == "^")
                {
                    flag2 = 3;
                };
        
                if(a == "E" || a == "C" || a == "S")
                {
                    a = a + inStr[i+1] + inStr[i+2];
                    i = i + 2;
                    flag2 = 4;
                };
                //flag2
                
                       
                if(flag2 == 0)
                {
                   pushInt(stekInt.next, flag2);
                   push(stek.next, a);
                   cout<< "\nPlease enter "<<a<<": ";
                   cin>>value;
                   pushInt(stekValue.next, value);
                }
                else
                {
                    if(flag2 == 4)
                    {
                        operand1 = pop(stek.next);
                        flag3 = popInt(stekInt.next);
                        if (flag3 == 0)
                        {
                            outStr = a + operand1;
                        }
                        else
                        {
                            outStr = a + "(" + operand1 + ")";
                        };
                        pushInt(stekInt.next, 0);
                        push(stek.next, outStr);
                        
                        op1 = popInt(stekValue.next);
                        value = calc1(a, op1);
                        pushInt(stekValue.next, value);
                    }
                    else
                    {
                        flag3 = popInt(stekInt.next);
                        operand1 = pop(stek.next);
                        if ((flag3 < flag2 && flag3 != 0) || ((a == "-" || a == "/") && flag3 == flag2))
                        {
                            operand2 = operand1;
                            operand1 = "(" + operand2 + ")";
                        };
                        operand2 = pop(stek.next);
                        flag3 = popInt(stekInt.next); 
                        if ((flag3 < flag2 && flag3 != 0) || ((a == "-" || a == "/") && flag3 == flag2))
                        {
                            outStr = "(" + operand2 + ")" + a + operand1;
                        }
                        else
                        {
                            outStr = operand2 + a + operand1;
                        };
                        pushInt(stekInt.next, flag2);
                        push(stek.next, outStr);
                        
                        
                        op1 = popInt(stekValue.next);
                        op2 = popInt(stekValue.next);
                        value = calc2(a, op1, op2);
                        pushInt(stekValue.next, value);
                    }
                }
            };
        
            flag3 = popInt(stekInt.next);
            value = popInt(stekValue.next);
            outStr = pop(stek.next);
        };
    
        cout<<outStr<<"\nResult = "<<value<<"\n";        
        
        
        
        cout<<"\n    If want to repeat, enter 'yes'. \n    If you want to end the program, enter 'end'. \n";
        cin>>outStr;
        if(outStr == "end")
        {
            flag1 = false;
        };
    };
    
    
    return 0;
}

