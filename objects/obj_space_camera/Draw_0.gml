draw_set_color(c_red);

if (draw_view_port) {
  draw_rectangle(
    view_port_min_x + draw_port_padding,
    view_port_min_y + draw_port_padding,
    view_port_max_x - draw_port_padding,
    view_port_max_y - draw_port_padding,
    true
  );
}

with (obj_ship) {
  if (other.draw_particle_emitter_regions) {
    draw_circle(center_x, center_y, emitter_radius, true);
  }
}

draw_reset();
