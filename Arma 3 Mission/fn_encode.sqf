/*
 */
#include "codec.h"

#define INC(v) v = v + 1
#define INCSET(array, pos, v) \
    array set [pos, v]; \
    INC(pos); \

diag_log ["fn_encode", _this];

private "_in";
_in = _this select 0;
private "_out";
_out = _this select 1;
private "_cursor";
_cursor = count _out;

switch (typeName _in) do {
    case "BOOL": {
        INCSET(_out, _cursor, BOOL);
        INCSET(_out, _cursor, if(_in) then { 1 } else { 0 });
    };
    case "SCALAR": {
        // Fixme, this is horribly inefficient
        if ((_in mod 1) != 0) then {
            INCSET(_out, _cursor, FLOAT);
        } else {
            INCSET(_out, _cursor, INTEGER);
        };
        private "_inarray";
        _inarray = toArray str _in;
        INCSET(_out, _cursor, count _inarray);
        { INCSET(_out, _cursor, _x) } forEach _inarray;
    };
    case "STRING": {
        private "_inarray";
        _inarray = toArray _in;
        INCSET(_out, _cursor, STRING);
        INCSET(_out, _cursor, count _inarray);
        { INCSET(_out, _cursor, _x) } forEach _inarray;
    };
    case "ARRAY": {
        INCSET(_out, _cursor, ARRAY);
        INCSET(_out, _cursor, count _in);
        { [_x, _out] call ESC_fn_encode; } forEach _in;
    }; 
    default {
        throw "fuck";
    };
};
