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

// ! Destroy particle systems
// part_type_destroy(global.thruster_particle_type);
// part_emitter_destroy(global.particle_system, global.thruster_particle_emitter);
// part_system_destroy(global.particle_system);
