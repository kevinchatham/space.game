max_stars = 1500;
spawn_distance = 10;

for (var _i = 0; _i < max_stars; _i++) {
  instance_create_layer(
    random(room_width),
    random(room_height),
    obj_game.background_layer,
    obj_star
  );
}
