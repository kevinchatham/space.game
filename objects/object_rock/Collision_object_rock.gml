/// @description Destroy Rocks

// if both rocks are in the room play the sound
if (
    (x >= 0 && x <= room_width && y >= 0 && y <= room_height) &&
    (other.x >= 0 && other.x <= room_width && other.y >= 0 && other.y <= room_height)
) {
    audio_play_sound(sound_collision, 1, false, collision_volume);
}

effect_create_above(ef_explosion, x, y, collision_scale, c_white);

instance_destroy();
instance_destroy(other);
