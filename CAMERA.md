# obj_display_manager

Create

```gml
/// @description Display Properties
ideal_width=0;
ideal_height=247;
zoom=1;
max_zooom=1;
display_width=display_get_width();
display_height=display_get_height();

aspect_ratio=display_width/display_height;

ideal_width=round(ideal_height*aspect_ratio);
//ideal_height=round(ideal_width / aspect_ratio);

//Perfect Pixel Scaling
if(display_width mod ideal_width != 0)
{
  var d = round(display_width/ideal_width);
  ideal_width=display_width/d;
}
if(display_height mod ideal_height != 0)
{
  var d = round(display_height/ideal_height);
  ideal_height=display_height/d;
}

//Check for odd numbers
if(ideal_width & 1)
  ideal_width++;
if(ideal_height & 1)
  ideal_height++;

//Calculate Max Zoom
max_zoom=floor(display_width/ideal_width);

for(var i=1; i<=room_last; i++)
{
  if(room_exists(i))
  {
    room_set_view(i,0,true,0,0,ideal_width,ideal_height,0,0,ideal_width,ideal_height,0,0,0,0,-1);
    room_set_view_enabled(i,true);
  }
}

window_set_size(ideal_width,ideal_height);
display_set_gui_size(ideal_width,ideal_height);
surface_resize(application_surface,ideal_width*zoom,ideal_height*zoom);

alarm[0]=1; //Sorry.  This line got left out of the tutorial vid.  This will center the window after the initial resizing.
room_goto(room_next(room));
```

Step

```gml
/// @description Zoom window
if(keyboard_check_pressed(ord("Z")))
{
  zoom++;

  if(zoom>max_zoom)
    zoom=1;

  window_set_size(ideal_width*zoom,ideal_height*zoom);
  surface_resize(application_surface,ideal_width*zoom,ideal_height*zoom);
  alarm[0]=1;
}
```

Alarm 0

```gml
/// @description Center window
window_center();
```

Alarm 1

```gml
/// @description Delayed Surface resize
surface_resize(application_surface,ideal_width*zoom,ideal_height*zoom);
```

Draw GUI

```gml
draw_set_font(fnt_normal);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(5,5,string_hash_to_newline(display_write_specs(display.screen)+"#"+
              display_write_specs(display.window)+"#"+
              display_write_specs(display.app_surface)+"#"+
              display_write_specs(display.view)+"#"+
              display_write_specs(display.gui))
              );

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(display_get_gui_width()-5,display_get_gui_height()-5,string_hash_to_newline("Bottom Right"));
```

# obj_test_player

Create

```gml
/// @description Properties
image_speed=.2

view_zoom=1;
view_max_zoom=10;
```

Step

```gml
/// @description Movement
var _speed=2.02;
left=keyboard_check(vk_left) || (mouse_check_button(mb_left) && mouse_x<x);
right=keyboard_check(vk_right)  || (mouse_check_button(mb_left) && mouse_x>=x);

x+=right*_speed;
x-=left*_speed;

x=clamp(x,0,room_width);

if(left || right)
{
  sprite_index=spr_elisa_walk;
  if(left)
    image_xscale=-1;
  else
    image_xscale=1;

}
else
  sprite_index=spr_elisa_stand;

///View Following

//Zoom view
var zoom_speed = .1;
view_zoom+=keyboard_check(vk_up)*zoom_speed;
view_zoom-=keyboard_check(vk_down)*zoom_speed;

view_zoom=clamp(view_zoom,1,view_max_zoom);

__view_set( e__VW.WView, 0, obj_display_manager.ideal_width/view_zoom );
__view_set( e__VW.HView, 0, obj_display_manager.ideal_height/view_zoom );

//Center on player
__view_set( e__VW.XView, 0, x-__view_get( e__VW.WView, 0 )/2-10 );
__view_set( e__VW.YView, 0, y-__view_get( e__VW.HView, 0 )/2-10 );

//clamp to room
__view_set( e__VW.XView, 0, clamp(__view_get( e__VW.XView, 0 ),0,room_width-__view_get( e__VW.WView, 0 )) );
__view_set( e__VW.YView, 0, clamp(__view_get( e__VW.YView, 0 ),0,room_height-__view_get( e__VW.HView, 0 )) );
```

Escape

```gml
/// @description Quit the demo.
game_end();
```

# Rooms

Home Room

- display_init
- Display manager object goes here.

Game Room

- rm_test
- Normal game objects here.
