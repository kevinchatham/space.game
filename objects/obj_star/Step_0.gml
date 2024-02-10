image_angle += rotation_speed;
image_angle = (image_angle + 360) % 360; // lock rotation to 360 degree range

if (image_alpha < 1) {
  image_alpha += 0.003;
}
