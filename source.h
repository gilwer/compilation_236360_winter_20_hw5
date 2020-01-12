

#ifndef __ATTRIBUTES_H
#define __ATTRIBUTES_H
#include <string>
#include <vector>
#include "bp.hpp"
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
    vector<pair<int,BranchLabelIndex>> truelist;
    vector<pair<int,BranchLabelIndex>> falselist;
    string instr;
} expAttribute;


#define YYSTYPE expAttribute	

#endif