// ! Animation
motion_set(direction, this.min_speed);
image_angle += this.rotation_speed;
image_angle = (image_angle + 360) % 360; // lock rotation to 360 degree range
