/// @description Game Start

global.particle_system = part_system_create_layer(layer, true);
global.particles = part_type_create();

part_system_global_space(global.particle_system, true);
part_system_depth(global.particle_system, 1);

part_type_alpha3(global.particles, 1, 0, 0);
part_type_color2(global.particles, c_aqua, c_blue);
part_type_shape(global.particles, pt_shape_pixel);
part_type_size(global.particles, 1, 1, 0, 0);
part_type_speed(global.particles, 0.5, 1, 0.01, 0);

global.emitter_2 = part_emitter_create(global.particle_system);

part_emitter_stream(
  global.particle_system,
  global.emitter_2,
  global.particles,
  2
);

// ! Destroy particle systems
// part_type_destroy(global.particles);
// part_emitter_destroy(global.particle_system, global.emitter_1);
// part_emitter_destroy(global.particle_system, global.emitter_2);
// part_system_destroy(global.particle_system);
// game_restart();
