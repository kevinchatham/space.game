// GPT for creating a fake infinite room

if (obj_ship.x < view_xview[0] + camera_border) {
    obj_ship.x = view_xview[0] + camera_border;
}

if (obj_ship.y < view_yview[0] + camera_border) {
    obj_ship.y = view_yview[0] + camera_border;
}

if (obj_ship.x > view_xview[0] + view_wview[0] - camera_border) {
    obj_ship.x = view_xview[0] + view_wview[0] - camera_border;
}

if (obj_ship.y > view_yview[0] + view_hview[0] - camera_border) {
    obj_ship.y = view_yview[0] + view_hview[0] - camera_border;
}