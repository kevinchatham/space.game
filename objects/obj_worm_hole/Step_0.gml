image_angle += rotation_speed;
if (!clicked && progress > 0) progress -= 1;
if (progress == 0) playing_sound = false;

if (progress >= 100) {
  room_change(rm_space, 60, c_black);
}
