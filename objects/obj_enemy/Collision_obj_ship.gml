/// @description

current_health = 0;

var _i = irandom(array_length(sounds) - 1);

audio_play_sound(sounds[_i], 1, false, global.effect_volume);

effect_create_above(ef_explosion, x, y, 0.01, c_white);
instance_destroy();

other.current_health -= 10;

log(other.current_health);
