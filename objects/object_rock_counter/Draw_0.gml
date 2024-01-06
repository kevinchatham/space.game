/// @description Rock Counter

// Draw the rock count
var _rock_count = instance_number(object_rock);
var _text = "Rocks: " + string(_rock_count);

// Set the font for drawing text
draw_set_font(font_default);

// Calculate the X coordinate for top-right corner
var _x = room_width - string_width(_text) - 10; // Adjust padding as needed

// Draw the text
draw_text(_x, 10, _text);
