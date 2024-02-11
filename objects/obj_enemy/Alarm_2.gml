/// @description Destroy the ship after a cetain time attacking.

current_health = 0;
effect_create_above(ef_explosion, x, y, 0.01, c_white);
instance_destroy();
