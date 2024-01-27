/// @description Left MB Down

if (progress < 100) {
  clicked = true;
  progress += 0.75;
  if(!playing_sound) {
    playing_sound = true;
    audio_play_sound(snd_worm_hole_charging,1,false,global.effect_volume)
  }
}
