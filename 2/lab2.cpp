#include <iostream>
#include <string>

using namespace std;

struct St 
{
	int key;
	St *next;
};
void push(St *&p, int elem);  // ��������� � ����
int pop(St *&p);                  // �������� �� �����
void vivod(St *p);                  // ����� ����������� ����� �� �����
void clear(St *p);                  // ������� �����

void push(St *&p, int elem)  // ��������� � ����
{
	St *t = new St;
	t -> key = elem;
	t -> next = p; 
	p = t;
}
int pop(St *&p)             // �������� �� �����
{
    int pop1;
	St *t = p;
	pop1 = t -> key;
	p = p -> next;
	delete t;
	return pop1;
}

void vivod(St *p)            // ����� ����������� ����� �� �����
{
	St *t = p;
	while (t) 
	{
		printf("%d ", t -> key);
		t = t -> next;
	}
	printf("\n");
}

void clear(St *p)            // ������� �����
{
	while (p) 
	{
		St *t = p;
		p = p -> next;
		delete t;
	}
}


int main()
{
    St stek;
    
    const string action[8] = { "+", "-", "/",
    "*", "exp", "cos", "sin", "^" };
    
    char a;
    int i;
    string inStr;
    cout<<"Please enter expresion: ";
    cin >>inStr;
    
    for(i = 0; i < inStr.length(); i++)
    {
        a = inStr[i];
        if(a <= 'z' & a >= 'a')
        {
            cout<<a;
        } else
        {
            push(stek.next, a);
        }
    } ;
    
    a = pop(stek.next);
    cout<<a;
    
    return 0;
}

