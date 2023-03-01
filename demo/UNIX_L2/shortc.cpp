#include <iostream>
using namespace std;
bool TestAllTrue(bool A, bool B, bool C, bool D)
{ return A && B && C && D;
}
extern bool x;
int main()
{  cout<<TestAllTrue(true, true, false, x)<<endl;
}
