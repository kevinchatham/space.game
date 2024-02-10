/// @description

if (state == 0) {
  timer++;

  if (timer >= duration) {
    room_goto(target_room);
    obj_ship.x = irandom(5000);
    obj_ship.y = irandom(5000);
    state = 1;
  }
} else if (state == 1) {
  timer--;
  if (timer <= 0) {
    instance_destroy();
  }
}

alpha = timer / duration;
