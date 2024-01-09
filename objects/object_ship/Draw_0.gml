// because I'm using the draw event I have to manually draw the sprite
draw_sprite_ext(sprite_new_ship, 0, x, y, 1, 1, image_angle, c_white, 1);

// ! Set up to draw circle around particle emitter
var _emitter_radius = 6;
var _base_angle = (image_angle + 270) % 360; // Ensure the angle is within [0, 360) range
var _base_offset = 4;

// Calculate the offset from the ship's center to the bottom center with horizontal adjustment
var _offset_x = lengthdir_x(sprite_width / 2 + _base_offset, _base_angle);
var _offset_y = lengthdir_y(sprite_height / 2 + _base_offset, _base_angle);

// Calculate the coordinates of the center of the circle
var _center_x = x + _offset_x;
var _center_y = y + _offset_y;

// Draw circle around particle emitter
// draw_set_color(c_red);
// draw_circle(_center_x, _center_y, _emitter_radius, true);
