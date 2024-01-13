// Custom cursor
window_set_cursor(cr_none);
cursor_sprite = spr_cursor;

// Start background music
// audio_play_sound(snd_ambiance, 1, true);

// ! Layers
global.main_layer = "Main";
global.background_layer = "Background";

global.thruster_particle_emitter_particle_count = 3;
global.draw_particle_emitter_regions = false;

global.particle_system = part_system_create_layer(layer, true);
part_system_global_space(global.particle_system, true);
part_system_depth(global.particle_system, 1);

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
var _space_size = 1_000_000
room_set_width(rm_space, _space_size);
room_set_height(rm_space, _space_size);
room_set_persistent(rm_space, true);
room_instance_add(rm_space, _space_size / 2, _space_size / 2, obj_ship);
room_instance_add(rm_space, 0, 0, obj_camera);
room_instance_add(rm_space, 0, 0, obj_rock_spawner);
room_instance_add(rm_space, 0, 0, obj_star_spawner);
show_debug_message("Room setup complete");
room_goto_next();

// ! Destroy particle systems
// part_type_destroy(global.thruster_particle_type);
// part_emitter_destroy(global.particle_system, global.thruster_particle_emitter);
// part_system_destroy(global.particle_system);
