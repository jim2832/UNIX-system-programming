#include <iostream>
using namespace std;
int whatever=false;
bool A( ) { cout<<"A"<<endl; return true; }
bool B( ) { cout<<"B"<<endl; return true; }
bool C( ) { cout<<"C"<<endl; return false; }
bool D( ) { cout<<"D"<<endl; return whatever; }
bool TestAllTrue ( ) {  return A( ) && B( ) && C( ) && D( ); }
main ( ) {  if  ( TestAllTrue ( ) ) cout<<"main"<<endl; }
