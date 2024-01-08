/// @description Game Start

global.particle_system = part_system_create_layer(layer, true);
global.particles = part_type_create();

part_system_global_space(global.particle_system, true);

part_type_alpha2(global.particles, 1, 0);

part_type_color2(global.particles, c_aqua, c_orange);
// * part_type_color2(global.particles, c_orange, c_yellow);
// * part_type_color2(global.particles, c_aqua, c_blue);

// part_type_alpha3(global.particles, 0, 0.5, 1);
// part_type_blend(global.particles, false);
// part_type_direction(global.particles, 270, 270, 0, 0);
// part_type_life(global.particles, 1, 10);
// part_type_orientation(global.particles, 270, 270, 0, 0, 0);
// part_type_scale(global.particles, 1, 1);
part_type_shape(global.particles, pt_shape_pixel);
part_type_size(global.particles, 1, 1, 0, 0);
// part_type_speed(global.particles, 1, 2, 0.1, 0);

global.emitter_2 = part_emitter_create(global.particle_system);

part_emitter_stream(
  global.particle_system,
  global.emitter_2,
  global.particles,
  1
);

// * part_type_shape(ind, shape)
// Sets the shape of the particle type to any of the constants above (default is pt_shape_pixel).

// * part_type_size(ind, size_min, size_max, size_incr, size_wiggle)
// Sets the size parameters for the particle type.
// You specify the minimum starting size, the maximum starting size, and the size increase in each step (use a negative number for a decrease in size).

// * part_type_scale(ind, xscale, yscale);
// Sets the horizontal and vertical scale.
// This factor is multiplied alongside the size parameters we just mentioned.
// It’s particularly useful when you need to scale differently in x- and y-direction.

// * part_type_color3(ind, colour1, colour2, colour3);
// Indicates which three colours the particule will fade between over the particle’s lifetime.

// * part_type_alpha3(ind, alpha1, alpha2, alpha3);
// Sets three alpha transparency parameters (0-1) for the particle type, which the particle will merge between over its lifetime.

// * part_type_speed(ind, speed_min, speed_max, speed_incr, speed_wiggle);
// Sets the minimum and maximum speed properties for the particle type.
// A random value between your minimum and maximum speeds is chosen when the particle is created.
// You can indicate a speed increase in each step. Use a negative number to slow the particle down (the speed will never become smaller than 0).

// * part_type_direction(ind, dir_min, dir_max, dir_incr, dir_wiggle);
// Sets the direction properties for the particle type.
// Again, you specify a range of directions in counterclockwise degrees (i.e. 0 indicates motion to the right).
// To let the particle move in a random direction, choose 0 and 360 as values.
// You can specify an increase in direction for each step.

// * part_type_orientation(ind, ang_min, ang_max, ang_incr, ang_wiggle, ang_relative);
// Sets the orientation angle properties for the particle type.
// You specify the minimum angle, the maximum angle, the increase in each step, and the amount of wiggling in the angle.
// You can also indicate whether the given angle should be relative (1) to the current direction of motion or absolute (0).
// By setting all values to 0 but ang_relative to 1, the particle orientation will precisely follow the path of the particle.

// * part_type_blend(ind, additive);
// Sets whether to use additive blending (1) or normal blending (0) for the particle type.

// * part_type_life(ind, life_min, life_max);
// Sets the lifetime bounds for the particle type.

// ! Destroy particle systems
// part_type_destroy(global.particles);
// part_emitter_destroy(global.particle_system, global.emitter_1);
// part_emitter_destroy(global.particle_system, global.emitter_2);
// part_system_destroy(global.particle_system);
// game_restart();
