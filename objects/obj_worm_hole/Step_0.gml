// ! Animation
motion_set(direction, min_speed);
image_angle += rotation_speed;
image_angle = (image_angle + 360) % 360; // lock rotation to 360 degree range

if(image_xscale >= min_image_scale && image_xscale <= max_image_scale){
  image_xscale += scale_rate;
  image_yscale += scale_rate;
}else{
  image_xscale -= scale_rate;
  image_yscale -= scale_rate;
}
