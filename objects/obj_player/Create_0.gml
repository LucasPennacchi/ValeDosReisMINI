/// @description Player default create
event_inherited(); // oEntity default create

#region DEFAULT (DO NOT CHANGE)

depth = 5;
instance_create_layer(x,y,"Instances",obj_player_shadow);
state = state_player.run;
origin = [x,y];

#endregion

#region PLAYER ATTRIBUTES (CAN CHANGE)

max_hp = 5;
dmg = 1;
velc = .8;

#endregion

#region FUNCTIONS


#endregion
