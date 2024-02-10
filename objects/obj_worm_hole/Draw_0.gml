draw_self();

if (progress > 0) {
  var _bar_width = 100;
  draw_roundrect(x - _bar_width / 2, y - 60, x + (_bar_width * progress) / 100 - _bar_width / 2, y - 50, false);
}
