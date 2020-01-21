//
// Created by Matan Gilad1 on 22/12/2019.
//

#ifndef COMPILATION_236360_WINTER_20_HW3_SYMBOL_V2_H
#define COMPILATION_236360_WINTER_20_HW3_SYMBOL_V2_H

#include <string>
#include <vector>
#include "hw3_output.hpp"

using namespace std;

namespace compi3 {

    class Symbol {
        string name;
        int offset;
        vector<string> values;
        string type;
        string ret_type;
        bool enum_var;
        bool enum_type;
        vector<string> args;

    public:
        // C'tor
        Symbol() : name(), offset(), values(), type(), enum_var(), args() {}
        Symbol(string name, int offset, string type, bool is_enum) : name(name), offset(offset), type(type),
                                                                     enum_var(is_enum), values(), args(),
                                                                     enum_type(false) {}


        Symbol(string name, int offset, string ret_type, bool is_enum, vector<string> args) : name(name), offset(offset),
                                                                                              ret_type(ret_type), enum_var(is_enum),
                                                                                              args(args), values(),
                                                                                              enum_type(false)
        {
            type = output::makeFunctionType(ret_type,args);
        }

        Symbol(string name, string type) : name(name), offset(), type("enum " + type), enum_var(true),
                                           values(), args(), enum_type(true) {}

        Symbol(string name, vector<string> values) : name(name), offset(), type("enum"), enum_var(false),
                                                     values(values), args(), enum_type(true) {}

        string get_symbol_name() {
            return this->name;
        }

        int get_symbol_offset() {
            return this->offset;
        }

        string get_type() {
            return this->type;
        }

        string get_ret_type() {
            return ret_type;
        }

        vector<string> get_args() {
            return this->args;
        }

        bool is_enum() {
            return this->enum_var;
        }

        bool is_enum_type() {
            return this->enum_type;
        }

        vector<string> get_enum_values() {
            return this->values;
        }

        bool operator<(const Symbol symbol) const {
            return name < symbol.name;
        }
    };
}

#endif //COMPILATION_236360_WINTER_20_HW3_SYMBOL_V2_H
