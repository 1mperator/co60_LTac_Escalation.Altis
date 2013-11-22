#define VAR(name, value) \
    private #name; \
    name = value

ESC_fn_encode = compile preprocessFile "fn_encode.sqf";
ESC_fn_decode = compile preprocessFile "fn_decode.sqf";
ESC_fn_encode_ex = compile preprocessFile "fn_encode_ex.sqf";
ESC_fn_decode_ex = compile preprocessFile "fn_decode_ex.sqf";

VAR(_encoded, []);
[player, _encoded] call ESC_fn_encode_ex;
diag_log _encoded;
diag_log toString _encoded;
diag_log count _encoded;

VAR(_obj, _encoded call ESC_fn_decode_ex);
diag_log _obj;
