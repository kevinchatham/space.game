if (draw_view_port) {
  draw_rectangle(view_port_min_x + 1, view_port_min_y + 1, view_port_max_x - 2, view_port_max_y - 2, true);
}

with (obj_ship) {
  if (other.draw_particle_emitter_regions) {
    draw_circle(center_x, center_y, emitter_radius, true);
  }
}
