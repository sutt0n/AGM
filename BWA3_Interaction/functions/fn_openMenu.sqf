// by commy2

BWA3_Interaction_Buttons = [];

_actions = [];
_class = _this;
if (_class == "") then {BWA3_Interaction_Target = cursorTarget};

_object = BWA3_Interaction_Target;
_config = configfile >> "CfgVehicles" >> typeOf _object >> "BWA3_Actions";
if (_class != "") then {_config = _config >> _this};

_count = count _config;
if (_count == 0) exitWith {};

for "_a" from 0 to (_count - 1) do {
	_action = _config select _a;

	if (count _action > 0) then {
		_displayName = getText (_action >> "displayName");
		_distance = getNumber (_action >> "distance");
		_condition = compile getText (_action >> "condition");
		_statement = compile getText (_action >> "statement");
		_showDisabled = getNumber (_action >> "showDisabled") == 1;
		_priority = getNumber (_action >> "priority");

		if ((_showDisabled || {call _condition}) && {player distance _object < _distance || {_distance == 0}}) then {
			_actions set [count _actions, [_displayName, _statement, _condition, _priority]];
		};
	};
};

_count = count _actions;
if (_count == 0) exitWith {};

_actions call BWA3_Interaction_fnc_sortOptionsByPriority;

BWA3_Interaction_Buttons = _actions;

closeDialog 0;
createDialog "BWA3_Interaction_Dialog";

if (_class == "") then {setMousePosition [0.5, 0.5]};

disableSerialization;
_dlgInteractionDialog = uiNamespace getVariable "BWA3_Interaction_Dialog";

/*
for "_a" from 0 to (_count - 1) do {
	_action = BWA3_Interaction_Buttons select _a;

	_ctrlInteractionDialog = _dlgInteractionDialog displayCtrl (10 + _a);
	_ctrlInteractionDialog ctrlShow true;
	_ctrlInteractionDialog ctrlSetText (_action select 0);
	_ctrlInteractionDialog ctrlEnable (call (_action select 2));
};
*/

for "_i" from 0 to 9 do {
	_ctrlInteractionDialog = _dlgInteractionDialog displayCtrl (10 + _i);
	_ctrlInteractionDialog ctrlShow true;

	if (_i < _count) then {
		_action = BWA3_Interaction_Buttons select _i;
		_ctrlInteractionDialog ctrlSetText (_action select 0);
		_ctrlInteractionDialog ctrlEnable (call (_action select 2));
	} else {
		_ctrlInteractionDialog ctrlSetText "";
		_ctrlInteractionDialog ctrlEnable false;
	}
};