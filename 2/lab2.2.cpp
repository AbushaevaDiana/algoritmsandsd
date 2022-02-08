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
    
    const string action[8] = { "+", "-", "/", "*", "exp", "cos", "sin", "^" };
    
    bool flag1;
    int i, i1, flag2;
    string inStr, a;
    cout<<"Please enter expresion: ";
    cin >>inStr;
    
    for(i = 0; i < inStr.length(); i++)
    {
        a = inStr[i];
        
        flag2 = 0; // letter
        for(i1 = 0; i1 < 8; i1++)
        {
            if(a == action[i1])
            {
                if(i1 <= 1)
                {
                    flag2 = 1; // + or -
                }
                
                if(2 <= i1 <= 3)
                {
                    flag2 = 2; // * or /
                }
                
                if(4 <= i1 <= 7)
                {
                    flag2 = 3; // exp or sin or cos or ^
                }
            }
        };
        
        if(flag2 == 0)
        {
            cout<<a;
        } else
        {
            push(stek.next, a);
        }
    };
    
    a = pop(stek.next);
    cout<<a;
    
    return 0;
}

