function room_change(_room = rm_space, _duration = 60, _color = c_white) {
  var _id = instance_create_depth(0, 0, 0, obj_fade);
  with (obj_fade) {
    target_room = _room;
    duration = _duration;
    color = _color;
  }
}
