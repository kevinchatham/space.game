draw_sprite_ext(sprite_new_ship, 0, x, y, 1, 1, image_angle, c_white, 1);

if (global.draw_particle_emitter_regions) {
  draw_set_color(c_red);
  draw_circle(center_x, center_y, emitter_radius, true);
}
