/// @description Inserir descrição aqui
event_inherited();

state = STATE_ENEMY.IDLE;

set_hp(3 + (global.difficulty));
dmg = 0.5 + (0.5 * global.difficulty);
invulnerability_delay = 0.5 + (0.3 * global.difficulty);
atk_delay = 1.1 - ((global.difficulty + 1)/10);

atk_range = 20;
follow_range = 50;
can_atk = true;

#region FUNCTIONS
function attack(){}
function change_state (_in_range_atk, _in_range_follow){
	
	if (_in_range_atk && can_atk) state = STATE_ENEMY.ATTACK;
	else if (!_in_range_atk && _in_range_follow) state = STATE_ENEMY.FOLLOW;
	else state = STATE_ENEMY.IDLE;
	
}
#endregion