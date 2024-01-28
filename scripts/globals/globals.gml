function build_layer_info() {
  global.ui_layer = "UI";
  global.main_layer = "Main";
  global.background_layer = "Background";
}

function build_options() {
  global.despawn_lifetime = 60;
  global.thruster_particle_emitter_particle_count = 3;
  global.master_volume = 1;
  global.music_volume = 0.2 * global.master_volume;
  global.effect_volume = 0.2 * global.master_volume;

  window_set_cursor(cr_none);
  cursor_sprite = cr_none;

  audio_play_sound(snd_ambiance, 1, true, global.music_volume);
}

/// @param {Id.Layer} _layer
function build_particle_systems(_layer) {
  global.particle_system = part_system_create_layer(_layer, true);
  global.thruster_particle_emitter = part_emitter_create(global.particle_system);
  global.thruster_particle_type = part_type_create();

  part_system_global_space(global.particle_system, true);
  part_system_depth(global.particle_system, 0);

  part_type_color2(global.thruster_particle_type, c_aqua, c_blue);
  part_type_shape(global.thruster_particle_type, pt_shape_pixel);
  part_type_size(global.thruster_particle_type, 1, 1, 0, 0);

  part_emitter_stream(
    global.particle_system,
    global.thruster_particle_emitter,
    global.thruster_particle_type,
    global.thruster_particle_emitter_particle_count
  );
}

/// @param {Real} _size
function build_rm_space(_size) {
  room_set_width(rm_space, _size);
  room_set_height(rm_space, _size);

  var _space_camera_id = room_instance_add(rm_space, 0, 0, obj_space_camera);
  var _rock_spawner_id = room_instance_add(rm_space, 0, 0, obj_asteroid_spawner);
  var _star_spawner_id = room_instance_add(rm_space, 0, 0, obj_background_spawner);
  var _worm_hole_spawner_id = room_instance_add(rm_space, 0, 0, obj_worm_hole_spawner);
  var _arrow_id = room_instance_add(rm_space, 0, 0, obj_arrow);
  var _arrow_worm_id = room_instance_add(rm_space, 0, 0, obj_arrow_worm);
  var _ship_id = room_instance_add(rm_space, _size / 2, _size / 2, obj_ship);
  var _enemy_ship_id = room_instance_add(rm_space, _size / 2, _size / 2, obj_enemy);
  var _ship_inventory_id = room_instance_add(rm_space, 0, 0, obj_ship_inventory);
  var _mouse_id = room_instance_add(rm_space, 0, 0, obj_mouse);

  layer_set_target_room(rm_space);
  var _main_layer_id = layer_get_id(global.main_layer);
  var _ui_layer_id = layer_get_id(global.ui_layer);
  layer_add_instance(_main_layer_id, _ship_id);
  layer_add_instance(_main_layer_id, _enemy_ship_id);
  layer_add_instance(_ui_layer_id, _arrow_id);
  layer_add_instance(_ui_layer_id, _arrow_worm_id);
  layer_add_instance(_ui_layer_id, _ship_inventory_id);
  layer_reset_target_room();

  room_goto_next();
}

// ! Destroy particle systems
// part_type_destroy(global.thruster_particle_type);
// part_emitter_destroy(global.particle_system, global.thruster_particle_emitter);
// part_system_destroy(global.particle_system);
