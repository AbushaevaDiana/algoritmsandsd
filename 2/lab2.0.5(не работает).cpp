#include <iostream>
#include <string>
#include <cmath> 

using namespace std;

struct St 
{
	string key;
	int value;
	St *next;
};
void push(St *&p, string elem, int number);  
string pop(St *&p, int op);

void push(St *&p, string elem, int number)  
{
	St *t = new St;
	t -> key = elem;
	t -> value = number;
	t -> next = p; 
	p = t;
}

string pop(St *&p, int op)            
{
    string pop1;
    int number;
	St *t = p;
	pop1 = t -> key;
	op = t -> value;
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

int setFlag2(string a,string inStr, int i)
{
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
    
    return flag2;
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
    if(a == "*")
    {
        sum = op2 ^ op1;
    };
    return sum;
}

int main()
{
    St stek;
    StInt stekInt;
    
    const string action[8] = { "+", "-", "/", "*", "^", "EXP", "COS", "SIN"};
    
    bool flag1;
    int i, value, flag2, flag3, op1, op2;
    string inStr, a, outStr, operand1, operand2, variables;
    flag1 = true;
    
    while(flag1)
    {
        outStr = "";
        variables = "";
        op1 = 0;
        op2 = 0;
        cout<<"Please enter expresion: ";
        getline(cin, inStr);
        
        if(inStr == "")
        {
            outStr = "You don't enter expresion";
        }
        else
        {
            for(i = 0; i < inStr.length(); i++)
            {
                a = inStr[i];
        
                flag2 = setFlag2(a, inStr, i) ;       
                if(flag2 == 0)
                {
                    pushInt(stekInt.next, flag2);
                    cout<< "\nPlease enter "<<a<<": ";
                    cin>>value;
                    push(stek.next, a, value);
                }
                else
                {
                    if(flag2 == 4)
                    {
                        operand1 = pop(stek.next, op1);
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
                        value = calc1(a, op1);
                        push(stek.next, a, value);
                    }
                    else
                    {
                        flag3 = popInt(stekInt.next);
                        operand1 = pop(stek.next, op1);
                        if (flag3 < flag2 && flag3 != 0)
                        {
                            operand2 = operand1;
                            operand1 = "(" + operand2 + ")";
                        };
                        operand2 = pop(stek.next, op2);
                        flag3 = popInt(stekInt.next); 
                        if (flag3 < flag2 && flag3 != 0)
                        {
                            outStr = "(" + operand2 + ")" + a + operand1;
                        }
                        else
                        {
                            outStr = operand2 + a + operand1;
                        };
                        pushInt(stekInt.next, flag2);
                        value = calc2(a, op1, op2);
                        push(stek.next, outStr, value);
                    }
                }
            };
            outStr = pop(stek.next, value);
        };
    
        cout<<outStr<<"\n Result = "<<value;        
        
        
        
        cout<<"\n    If want to repeat, press Enter. \n    If you want to end the program, enter 'end'. \n";
        cin>> inStr;
        if(inStr == "end")
        {
            flag1 = false;
        };
    };
    
    
    return 0;
}

