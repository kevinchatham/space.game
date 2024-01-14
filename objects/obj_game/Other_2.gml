// Custom cursor
window_set_cursor(cr_none);
cursor_sprite = spr_cursor;

// Start background music
// audio_play_sound(snd_ambiance, 1, true);

// ! Layers
global.main_layer = "Main";
global.background_layer = "Background";

global.thruster_particle_emitter_particle_count = 3;

global.particle_system = part_system_create_layer(layer, true);
part_system_global_space(global.particle_system, true);
part_system_depth(global.particle_system, 0);

global.thruster_particle_emitter = part_emitter_create(global.particle_system);

global.thruster_particle_type = part_type_create();
part_type_color2(global.thruster_particle_type, c_aqua, c_blue);
part_type_shape(global.thruster_particle_type, pt_shape_pixel);
part_type_size(global.thruster_particle_type, 1, 1, 0, 0);

part_emitter_stream(
  global.particle_system,
  global.thruster_particle_emitter,
  global.thruster_particle_type,
  global.thruster_particle_emitter_particle_count
);

// ! Room Configuration
var _space_size = 5000;
room_set_width(rm_space, _space_size);
room_set_height(rm_space, _space_size);
var _space_camera_id = room_instance_add(rm_space, 0, 0, obj_space_camera);
var _rock_spawner_id = room_instance_add(rm_space, 0, 0, obj_rock_spawner);
var _star_spawner_id = room_instance_add(rm_space, 0, 0, obj_star_spawner);
var _obj_arrow_id = room_instance_add(rm_space, 0, 0, obj_arrow);
var _worm_hole_id = room_instance_add(rm_space, _space_size / 2, _space_size / 2, obj_worm_hole);
var _ship_id = room_instance_add(rm_space, _space_size / 2, _space_size / 2, obj_ship);

layer_set_target_room(rm_space);
var _main_layer_id = layer_get_id(global.main_layer);
var _background_layer_id = layer_get_id(global.main_layer);
layer_add_instance(_main_layer_id, _ship_id);
layer_add_instance(_background_layer_id, _ship_id);
layer_reset_target_room();

room_goto_next();

// ! Destroy particle systems
// part_type_destroy(global.thruster_particle_type);
// part_emitter_destroy(global.particle_system, global.thruster_particle_emitter);
// part_system_destroy(global.particle_system);
