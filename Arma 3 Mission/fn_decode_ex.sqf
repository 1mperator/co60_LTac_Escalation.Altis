#define VAR(name, value) \
    private #name; \
    name = value

VAR(_data, _this call ESC_fn_decode);
VAR(_unit, (_data select 0) createVehicle (_data select 1));
_unit addBackpack (_data select 2);
{ _unit addItemToBackpack _x;
} forEach (_data select 3);

