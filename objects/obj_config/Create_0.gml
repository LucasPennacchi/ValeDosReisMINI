/// @description Inserir descrição aqui
global.difficulty = 0;
global.dialogue = false;
global.pause = false;
global.fullscreen = false;

global.volume = 100;
last_volume = global.volume;
audio_master_gain(global.volume / 100);

game_set_speed(60, gamespeed_fps);
global.frames_per_second = game_get_speed(gamespeed_fps);

audio_group_load(Player);
audio_group_load(Menu);

global.show_hp_bar = false;

global.game_time = 0;
global.show_game_time = 0;

#region KEYS
global.key_up = ord("W");
global.key_down = ord("S");
global.key_left = ord("A");
global.key_right = ord("D");

global.key_roll = vk_space;
global.key_attack = vk_shift;
global.key_interact = ord("E");
global.key_pause = vk_escape

#endregion