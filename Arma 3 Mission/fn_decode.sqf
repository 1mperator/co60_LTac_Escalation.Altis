/*
 */
#include "codec.h"

#define INC(v) v = v +1

diag_log ["fn_decode", _this];

private "_in";
_in = _this;

private "_readstring";
_readstring = {
    private "_cursor";
    _cursor = _this;
    private "_len";
    _len = _in select _cursor;
    INC(_cursor);
    private "_array";
    _copy = [];
    private "_idx";
    _idx = 0;
    for [{}, {_idx <= _len}, {INC(_idx); INC(_cursor)}] do {
        _copy set [_idx, _in select _cursor];
    };
    toString _copy
};

private "_read";
_read = {
    private "_ret";
    _ret = nil;

    private "_cursor";
    _cursor = _this;

    switch (_in select _cursor) do {
        case BOOL: {
            switch (_in select (_cursor + 1)) do {
                case 0: {
                    _ret = false;
                };
                case 1: {
                    _ret = true;
                };
                default {
                    throw "fuck";
                };
            }
        };
        case INTEGER;
        case FLOAT: {
            INC(_cursor);
            _ret = parseNumber (_cursor call _readstring);
        };
        case STRING: {
            INC(_cursor);
            _ret = _cursor call _readstring;
        };
        case ARRAY: {
        };
        default {
            throw "fuck";
        };
    };
    _ret 
};

0 call _read
