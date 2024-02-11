var _respawn_count = 1 - instance_number(obj_worm_hole); // 1 max

with (obj_space_camera) {
  spawn_at_random(obj_worm_hole, _respawn_count, 0, global.main_layer);
}
