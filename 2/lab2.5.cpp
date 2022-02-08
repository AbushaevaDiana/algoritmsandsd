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
void push(St *&p, string elem);  // ��������� � ����
string pop(St *&p);                  // �������� �� �����
void vivod(St *p);                  // ����� ����������� ����� �� �����
void clear(St *p);                  // ������� �����

void push(St *&p, string elem)  // ��������� � ����
{
	St *t = new St;
	t -> key = elem;
	t -> next = p; 
	p = t;
}

string pop(St *&p)             // �������� �� �����
{
    string pop1;
	St *t = p;
	pop1 = t -> key;
	p = p -> next;
	delete t;
	return pop1;
}



int main()
{
    St stek;
    
    const string action[8] = { "+", "-", "/", "*", "^", "EXP", "COS", "SIN"};
    
    bool flag1;
    int i, i1, flag2, flag3;
    string inStr, a, outStr, operand1, operand2;
    cout<<"Please enter expresion: ";
    cin >>inStr;
    
    flag3 = 0;
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
            push(stek.next, a);
        }else
        {
            if(flag2 == 4)
            {
                operand1 = pop(stek.next);
                outStr = a + "(" + operand1 + ")";
                cout<<flag2<<" "<<outStr<<"\n";
                push(stek.next, outStr);
            }
            else
            {
                operand1 = pop(stek.next);
                operand2 = pop(stek.next);
                outStr = operand2 + a + operand1;
                cout<<flag2<<" "<<outStr<<"\n";
                push(stek.next, outStr);   
            }
        }
    };
    
    outStr = pop(stek.next);
    cout<<outStr;
    
    return 0;
}

