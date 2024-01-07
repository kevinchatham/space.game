function __init_view() {
  enum e__VW {
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID,
  }
}

function __view_get(argument0, argument1) {
  var __prop = argument0;
  var __index = argument1;

  var __res = -1;

  switch (__prop) {
    case e__VW.XView:
      var __cam = view_get_camera(__index);
      __res = camera_get_view_x(__cam);
      break;
    case e__VW.YView:
      var __cam = view_get_camera(__index);
      __res = camera_get_view_y(__cam);
      break;
    case e__VW.WView:
      var __cam = view_get_camera(__index);
      __res = camera_get_view_width(__cam);
      break;
    case e__VW.HView:
      var __cam = view_get_camera(__index);
      __res = camera_get_view_height(__cam);
      break;
    case e__VW.Angle:
      var __cam = view_get_camera(__index);
      __res = camera_get_view_angle(__cam);
      break;
    case e__VW.HBorder:
      var __cam = view_get_camera(__index);
      __res = camera_get_view_border_x(__cam);
      break;
    case e__VW.VBorder:
      var __cam = view_get_camera(__index);
      __res = camera_get_view_border_y(__cam);
      break;
    case e__VW.HSpeed:
      var __cam = view_get_camera(__index);
      __res = camera_get_view_speed_x(__cam);
      break;
    case e__VW.VSpeed:
      var __cam = view_get_camera(__index);
      __res = camera_get_view_speed_y(__cam);
      break;
    case e__VW.Object:
      var __cam = view_get_camera(__index);
      __res = camera_get_view_target(__cam);
      break;
    case e__VW.Visible:
      __res = view_get_visible(__index);
      break;
    case e__VW.XPort:
      __res = view_get_xport(__index);
      break;
    case e__VW.YPort:
      __res = view_get_yport(__index);
      break;
    case e__VW.WPort:
      __res = view_get_wport(__index);
      break;
    case e__VW.HPort:
      __res = view_get_hport(__index);
      break;
    case e__VW.Camera:
      __res = view_get_camera(__index);
      break;
    case e__VW.SurfaceID:
      __res = view_get_surface_id(__index);
      break;
    default:
      break;
  }
  return __res;
}

/// @description display_write_spec(display enum)
/// @param display enum
function display_write_specs() {
  enum display {
    screen,
    window,
    gui,
    app_surface,
    view,
  }
  var str = "";
  switch (argument[0]) {
    case display.screen:
      str =
        "Display: " +
        string(display_get_width()) +
        " x " +
        string(display_get_height()) +
        " (" +
        string(display_get_width() / display_get_height()) +
        ")";
      break;
    case display.window:
      str =
        "Window: " +
        string(window_get_width()) +
        " x " +
        string(window_get_height()) +
        " (" +
        string(window_get_width() / window_get_height()) +
        ")";
      break;
    case display.gui:
      str =
        "GUI: " +
        string(display_get_gui_width()) +
        " x " +
        string(display_get_gui_height()) +
        " (" +
        string(display_get_gui_width() / display_get_gui_height()) +
        ")";
      break;
    case display.app_surface:
      str =
        "App Surface: " +
        string(surface_get_width(application_surface)) +
        " x " +
        string(surface_get_height(application_surface)) +
        " (" +
        string(
          surface_get_width(application_surface) /
            surface_get_height(application_surface)
        ) +
        ")";
      break;
    case display.view:
      str =
        "View: " +
        string(__view_get(e__VW.WView, 0)) +
        " x " +
        string(__view_get(e__VW.HView, 0)) +
        " (" +
        string(__view_get(e__VW.WView, 0) / __view_get(e__VW.HView, 0)) +
        ")";
      break;
  }
  return str;
}

draw_set_font(font_default);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(
  5,
  5,
  string_hash_to_newline(
    display_write_specs(display.screen) +
      "#" +
      display_write_specs(display.window) +
      "#" +
      display_write_specs(display.app_surface) +
      "#" +
      display_write_specs(display.view) +
      "#" +
      display_write_specs(display.gui)
  )
);

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(
  display_get_gui_width() - 5,
  display_get_gui_height() - 5,
  string_hash_to_newline("Bottom Right")
);
