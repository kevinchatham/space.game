draw_self();

if (progress > 0) {
  var _bar_width = 100;
  draw_rectangle(x - _bar_width / 2, y - 45, x + (_bar_width * progress) / 100 - _bar_width / 2, y - 40, false);
}
