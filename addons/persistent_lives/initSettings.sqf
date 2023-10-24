// https://cbateam.github.io/CBA_A3/docs/files/settings/fnc_addSetting-sqf.html

private _category = LLSTRING(CATEGORY);

[
    QGVAR(enabled),
    "CHECKBOX",
    [LLSTRING(ENABLED_TITLE), LLSTRING(ENABLED_DESCRIPTION)],
    _category,
    false,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(quantity),
    "SLIDER",
    [LLSTRING(QUANTITY_TITLE), LLSTRING(QUANTITY_DESCRIPTION)],
    _category,
    [0, 100, 3, 0],
    true,
    {},
    true
] call CBA_fnc_addSetting;
