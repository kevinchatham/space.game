/// @description Draw

draw_self();
if (asteroid.current_health < asteroid.max_health && asteroid.current_health > 0) {
  var _bar_width = sprite_width / 2;
  var _bar_height = 6;

  var _x = x - _bar_width / 2;
  var _y = y - 20;
  var _h = _y - _bar_height;
  var _w = _x + _bar_width * (asteroid.current_health / asteroid.max_health);

  draw_roundrect(_x, _y, _w, _h, false);
}
