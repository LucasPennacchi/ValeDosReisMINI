/// @description Inserir descrição aqui
event_inherited();

state = STATE_ENEMY.IDLE;

set_hp(3 + (global.difficulty));
dmg = 0.5 + (0.5 * global.difficulty);
invulnerability_delay = 0.5 + (0.3 * global.difficulty);

atk_range = 20;
follow_range = 50;
can_atk = true;

#region FUNCTIONS
attack(){}

#endregion