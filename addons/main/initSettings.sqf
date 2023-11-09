// https://cbateam.github.io/CBA_A3/docs/files/settings/fnc_addSetting-sqf.html

private _category = LLSTRING(CATEGORY);

[
    QGVAR(debug),
    "CHECKBOX",
    [LLSTRING(DEBUG), LLSTRING(DEBUG_DESCRIPTION)],
    _category,
    false,
    true,
    {},
    true
] call CBA_fnc_addSetting;
