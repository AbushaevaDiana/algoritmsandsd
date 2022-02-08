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
        
        if(a == "E" || a == "C" || a == "S")
        {
            a = a + inStr[i+1] + inStr[i+2];
            i = i + 2;
        };
        
        flag2 = 0; // letter
        
        for(i1 = 0; i1 < 8; i1++)
        {
            if(a == action[i1])
            {
                if(i1 <= 1)
                {
                    flag2 = 1; // + or -
                };
                
                if(2 <= i1 <= 3)
                {
                    flag2 = 2; // * or /
                };
                
                if(i1 == 4)
                {
                    flag2 = 3; // ^
                };
                
                if(5 <= i1 <= 7)
                {
                    flag2 = 4;  // exp or sin or cos
                };
            };
        };
        
        if(flag2 == 0)
        {
            push(stek.next, a);
        }else
        {
            if(flag2 <= flag3)
            {
                operand1 = pop(stek.next);
                operand2 = pop(stek.next);
                outStr = operand2 + a + operand1;
                push(stek.next, outStr);
            };
            if(flag2 > flag3 & flag2 != 0)
            {
                operand1 = pop(stek.next);
                operand2 = pop(stek.next);
                outStr = "(" + operand1 + ")" + a + operand2;
                push(stek.next, outStr);
                flag3 = flag2;
            }
        }
    };
    
    outStr = pop(stek.next);
    cout<<outStr;
    
    return 0;
}

