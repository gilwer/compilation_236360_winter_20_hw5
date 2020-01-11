

#ifndef __ATTRIBUTES_H
#define __ATTRIBUTES_H
#include <string>
#include <vector>
using namespace std;

typedef struct
{
	string str;
	string type;
	bool isEnum = false;
	int val;
	vector<string>* argTypes;
	vector<string>* args;
	int lineno;
} expAttribute;


#define YYSTYPE expAttribute	

#endif