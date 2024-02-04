draw_self();
if (current_health < max_health) {
  var _bar_width = sprite_width;
  var _bar_height = 6;

  var _x = x - _bar_width / 2;
  var _y = y - 20;
  var _h = _y - _bar_height;
  var _w = _x + _bar_width * (current_health / max_health);

  draw_roundrect(_x, _y, _w, _h, false);
}
