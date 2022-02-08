#include <iostream>
#include <string>
#include <algorithm>
#include <vector> 

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


int main()
{
    St stek;
    StInt stekInt;
    
    const string action[8] = { "+", "-", "/", "*", "^", "EXP", "COS", "SIN"};
    
    bool flag1;
    int i, i1, flag2, flag3;
    string inStr, a, outStr, operand1, operand2;
    cout<<"Please enter expresion: ";
    cin >>inStr;
    
    outStr = "";
    
    for(i = 0; i < inStr.length(); i++)
    {
        a = inStr[i];
        
        
        // flag2
        flag2 = 0; // letter
        
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
                cout<<flag2<<" "<<outStr<<"\n";
                pushInt(stekInt.next, 0);
                push(stek.next, outStr);
                
            }
            else
            {
                flag3 = popInt(stekInt.next);
                operand1 = pop(stek.next);
                if (flag3 < flag2 && flag3 != 0)
                {
                    operand2 = operand1;
                    operand1 = "(" + operand2 + ")";
                };
                operand2 = pop(stek.next);
                flag3 = popInt(stekInt.next); 
                if (flag3 < flag2 && flag3 != 0)
                {
                    outStr = "(" + operand2 + ")" + a + operand1;
                }
                else
                {
                    outStr = operand2 + a + operand1;
                };
                cout<<flag2<<" "<<outStr<<"\n";
                pushInt(stekInt.next, flag2);
                push(stek.next, outStr);
                    
            }
                   
        }
    };
    
    outStr = pop(stek.next);
    cout<<outStr;
    
    return 0;
}

