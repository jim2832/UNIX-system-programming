#include <iostream>
#include <stdlib.h>
using namespace std;
int main(int argc, char **argv) {
  cout << argc-1<<" arguments. The last is: "<<argv[argc-1];
  cout <<endl;
  return 0;
} 
