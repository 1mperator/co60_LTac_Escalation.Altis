#define VAR(name, value) \
    private #name; \
    name = value

VAR(_unit, _this select 0);
VAR(_out, _this select 1);
[[
    typeOf _unit,
    position _unit,
    backpack _unit,
    backpackItems _unit
], _out] call ESC_fn_encode;
