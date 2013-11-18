private ["_in","_out", "_fn_encode"];

/*
_code = {
    private ["_r"];
    diag_log ["_code", _this];
    if (_this < 10) then {
        _r = (_this + 1) call _code;
    } else {
        _r = _this;
    };
    _r
};
diag_log str (5 call _code);
diag_log str (40 call _code);
*/

_fn_encode = call compile preprocessFile "fn_encode.sqf";

{
    private "_in";
    _in = _x select 0;
    private "_expected";
    _expected = _x select 1;
    private "_out";
    _out = [];

    [_in, _out] call _fn_encode;

    if ([_out, _expected] call BIS_fnc_areEqual) then {
        diag_log "Test passed!";
    } else {
        diag_log "Test failed...";
        diag_log format ["Obtained: %1", _out];
        diag_log format ["Expected: %1", _expected];
    }
} forEach [
    ["spam", [1, 4, 115, 112, 97, 109]],
    [[4, false, [1, true, []]], [5, 3, 3, 1, 52, 2, 0, 5, 3, 3, 1, 49, 2, 1, 5, 0]]
];
