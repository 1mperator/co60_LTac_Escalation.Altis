ESC_fn_encode = compile preprocessFile "fn_encode.sqf";
ESC_fn_decode = compile preprocessFile "fn_decode.sqf";

diag_log "========================================";
diag_log "Beginning tests...";
diag_log "========================================";

{
    private "_native";
    _native = _x select 0;
    private "_encoded";
    _encoded = _x select 1;

    private "_out";
    _out = [];

    [_native, _out] call ESC_fn_encode;

    if ([_out, _encoded] call BIS_fnc_areEqual) then {
        diag_log "Encoding passed!";
    } else {
        diag_log "Encoding failed...";
        diag_log format ["Obtained: %1", _out];
        diag_log format ["Expected: %1", _encoded];
    };

    _out = _encoded call ESC_fn_decode;

    if ([_out, _native] call BIS_fnc_areEqual) then {
        diag_log "Decoding passed!";
    } else {
        diag_log "Decoding failed...";
        diag_log format ["Obtained: %1", _out];
        diag_log format ["Expected: %1", _native];
    };
} forEach [
    ["spam", [1, 4, 115, 112, 97, 109]],
    [[4, false, [1, true, []]], [5, 3, 3, 1, 52, 2, 0, 5, 3, 3, 1, 49, 2, 1, 5, 0]]
];
