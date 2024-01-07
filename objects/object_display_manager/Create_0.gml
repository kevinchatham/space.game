/// @description Display Properties
ideal_width=0;
ideal_height=360;
zoom=1;
max_zooom=1;
display_width=display_get_width();
display_height=display_get_height();

aspect_ratio=display_width/display_height;

ideal_width=round(ideal_height*aspect_ratio);

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
if(ideal_width & 1) ideal_width++;
if(ideal_height & 1) ideal_height++;

//Calculate Max Zoom
max_zoom=floor(display_width/ideal_width);

for(var _i=1; _i<=room_last; _i++)
{
  if(room_exists(_i))
  {
	var _w = camera_get_view_width(0)
	var _h = camera_get_view_height(0)
    room_set_viewport(_i, 0, true, _w, _h, ideal_width, ideal_height);
	//room_set_viewport(_i, 0, true, 0, 0, ideal_width, ideal_height);

    // OLD VERSION FROM TUTORIAL
    // room_set_view(i,0,true,0,0,ideal_width,ideal_height,0,0,ideal_width,ideal_height,0,0,0,0,-1);

    room_set_view_enabled(_i,true);
  }
}

window_set_size(ideal_width,ideal_height);
display_set_gui_size(ideal_width,ideal_height);
surface_resize(application_surface,ideal_width*zoom,ideal_height*zoom);

alarm[0]=1;
room_goto(room_next(room));
