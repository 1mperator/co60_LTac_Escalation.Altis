/*
 */
#include "codec.h"

#define INC(v) v = v + 1
#define VAR(name, value) \
    private #name; \
    name = value

diag_log ["fn_decode", _this];

VAR(_in, _this);
VAR(_cursor, 0);

private "_readstring";
_readstring = {
    VAR(_copy, []);
    VAR(_idx, 0);
    VAR(_len, _in select _cursor);
    INC(_cursor);
    for [{}, {_idx < _len}, {INC(_idx); INC(_cursor)}] do {
        _copy set [_idx, _in select _cursor];
    };
    toString _copy
};

private "_read";
_read = {
    VAR(_ret, nil);
    VAR(_type, _in select _cursor);
    INC(_cursor);
    switch (_type) do {
        case BOOL: {
            switch (_in select _cursor) do {
                case 0: {
                    _ret = false;
                };
                case 1: {
                    _ret = true;
                };
                default {
                    throw "fuck";
                };
            };
            INC(_cursor);
        };
        case INTEGER;
        case FLOAT: {
            _ret = parseNumber (_cursor call _readstring);
        };
        case STRING: {
            _ret = _cursor call _readstring;
        };
        case ARRAY: {
            VAR(_count, _in select _cursor);
            INC(_cursor);
            _ret = [];
            VAR(_idx, 0);
            for [{}, {_idx < _count}, {INC(_idx)}] do {
                _ret set [_idx, _cursor call _read];
            };
        };
        default {
            throw "fuck";
        };
    };
    _ret 
};

call _read
