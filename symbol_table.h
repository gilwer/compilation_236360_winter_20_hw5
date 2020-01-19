//
// Created by Matan Gilad1 on 21/12/2019.
//

#ifndef COMPILATION_236360_WINTER_20_HW3_SYMBOL_TABLE_V2_H
#define COMPILATION_236360_WINTER_20_HW3_SYMBOL_TABLE_V2_H

#include <string>
#include <vector>
#include <stack>
#include <map>
#include <list>
#include "symbol.h"

using namespace std;

namespace compi3 {

    class SymbolTable {

        map<string, Symbol> symbols_map;
        stack<list<Symbol>> symbols_stack;

    public:
        void open_scope();
        int close_scope();

        bool define_symbol(string symbol, string type, bool is_enum,int offset);
        bool is_symbol_defined(string symbol);

        bool define_func_symbol(string symbol, string ret_type, bool is_enum, vector<string> args);
        string get_func_ret(string symbol);
        vector<string> get_func_args(string symbol);

        string define_enum_symbol(string symbol, vector<string> values);
        bool is_enum(string symbol);
        bool is_enum_type(string symbol);
        vector<string> get_enum_values(string symbol);

        string get_var_type(string id);

        bool define_func_arg(string symbol, string type, bool is_enum,int offset);

        list<Symbol> get_current_symbols();

        int enum_to_int(string enum_value);

    private:
        int _calc_current_offset() {
            auto current_scope = symbols_stack.top();
            return 1 + current_scope.front().get_symbol_offset();
        }

        bool _save_new_symbol(Symbol curr_symbol) {
            // add to list in current scope (top stack)
            if(is_symbol_defined(curr_symbol.get_symbol_name())){
                return false;
            }
            auto& current_scope = symbols_stack.top();
            current_scope.push_back(curr_symbol);

            // save in map
            std::cout << "; " << "saves: " << curr_symbol.get_symbol_name() << std::endl;
            symbols_map[curr_symbol.get_symbol_name()] = curr_symbol;

            return true;
        }
    };

    void SymbolTable::open_scope() {
        list<Symbol> new_scope;
        symbols_stack.push(new_scope);
    }

    int SymbolTable::close_scope() {
        list<Symbol> current_scope = symbols_stack.top();
        output::endScope();
        int offset = 0;

        for ( auto sym : current_scope ) {
            if(!sym.is_enum_type()){
               output::printID(sym.get_symbol_name(),sym.get_symbol_offset(),sym.get_type());
               //offset = offset < sym.get_symbol_offset() ? sym.get_symbol_offset() : offset;
               offset++;
            }
        }

        for ( auto sym : current_scope ) {
            if(sym.get_type()=="enum"){
               vector<string> values = sym.get_enum_values();
               output::printEnumType(sym.get_symbol_name(),values);
            }
        }
        for ( auto sym : current_scope ) {
            symbols_map.erase(sym.get_symbol_name());
        }

        symbols_stack.pop();

        return offset;
    }

    bool SymbolTable::define_symbol(string symbol, string type, bool is_enum, int offset) {
        // add to list in current scope (top stack) & save in map
        Symbol curr_symbol = Symbol(symbol, offset, type, is_enum);
        return _save_new_symbol(curr_symbol);
    }

    bool SymbolTable::define_func_arg(string symbol, string type, bool is_enum,int offset) {
        // add to list in current scope (top stack) & save in map
        Symbol curr_symbol = Symbol(symbol, offset, type, is_enum);
        return _save_new_symbol(curr_symbol);
    }

    bool SymbolTable::is_symbol_defined(string symbol) {
        // check if defined in map
        return symbols_map.find(symbol) != symbols_map.end();
    }

    bool SymbolTable::define_func_symbol(string symbol, string ret_type, bool is_enum, vector<string> args) {
        // add to list in current scope (top stack) & save in map
        Symbol curr_symbol = Symbol(symbol,  0, ret_type, is_enum, args);
        return _save_new_symbol(curr_symbol);
    }

    string SymbolTable::get_func_ret(string symbol) {
        Symbol func = symbols_map[symbol];
        return func.get_ret_type();
    }

    vector<string> SymbolTable::get_func_args(string symbol) {
        Symbol func = symbols_map[symbol];
        return func.get_args();
    }

    string SymbolTable::define_enum_symbol(string symbol, vector<string> values) {
        // add to list in current scope (top stack) & save in map
        for ( auto value : values) {
            Symbol curr_symbol = Symbol(value, symbol);
            if(!_save_new_symbol(curr_symbol)){
               return value;
            }
        }
        Symbol curr_symbol = Symbol(symbol, values);
        return _save_new_symbol(curr_symbol)?"":symbol;
    }

    bool SymbolTable::is_enum(string symbol) {
        auto curr_symbol = symbols_map[symbol];
        return curr_symbol.is_enum();
    }

    bool SymbolTable::is_enum_type(string symbol) {
        auto curr_symbol = symbols_map[symbol];
        return curr_symbol.is_enum_type();
    }

    vector<string> SymbolTable::get_enum_values(string symbol) {
        vector<string> res;
        if( !is_enum_type(symbol) ) return res;

        auto curr_symbol = symbols_map[symbol];
        std::cout << "; " << "curr_symbol : " << curr_symbol.get_symbol_name() << std::endl;
        res = curr_symbol.get_enum_values();
        return res;
    }

    string SymbolTable::get_var_type(string symbol) {
        string res = "";
        //if( !is_enum(symbol) ) return res;

        auto curr_symbol = symbols_map[symbol];
        res = curr_symbol.get_type();
        return res;
    }

    list<Symbol> SymbolTable::get_current_symbols(){
        return symbols_stack.top();
    }

    int SymbolTable::enum_to_int(string enum_value) {
        string type = get_var_type(enum_value).substr(5);
        std::cout << "; " << "type : " << type << std::endl;

        vector<string> values = get_enum_values(type);
        std::cout << "; ";
        for (int i = 0; i < values.size(); ++i)
        {
            std::cout << "value" << i << " : " << values[i] << ", ";
            if (values[i] == enum_value)
            {
                return i;
                std::cout << std::endl;
            }
        }
        
        std::cout << std::endl;

        return -1;
    }
}


#endif //COMPILATION_236360_WINTER_20_HW3_SYMBOL_TABLE_V2_H
