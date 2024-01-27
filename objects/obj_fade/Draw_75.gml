/// @description

var _g_width = display_get_gui_width();
var _g_height = display_get_gui_height();

draw_set_alpha(alpha);
draw_set_color(color);

draw_rectangle(0, 0, _g_width, _g_height, false);

draw_set_alpha(1);
draw_set_color(c_white);
