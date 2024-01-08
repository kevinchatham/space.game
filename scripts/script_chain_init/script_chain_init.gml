function script_chain_init(){
    var _person1 = instance_create_layer(room_width / 4, room_height / 2, "Instances", object_person);
    
    var _carabiner = instance_create_layer(room_width / 4, room_height / 2, "Instances", object_chain_end);
    
    var _link = physics_joint_distance_create(_person1, _carabiner, _person1.x, _person1.y, _carabiner.x, _carabiner.y, false);
    physics_joint_set_value(_link, phy_joint_damping_ratio, 100);
    physics_joint_set_value(_link, phy_joint_frequency, 10);

    var _segments_precision = 30;

    var _offset_x = room_width / 4 / _segments_precision;
    var _next_rope = instance_create_layer(_person1.x + _offset_x, _person1.y, "Ropes", object_chain_link);

    var _attach = physics_joint_distance_create(_carabiner, _next_rope, _carabiner.x, _carabiner.y, _next_rope.x, _next_rope.y, false);
    physics_joint_set_value(_attach, phy_joint_damping_ratio, 1);
    physics_joint_set_value(_attach, phy_joint_frequency, 10);

    with (_next_rope) {
        previous_link = _carabiner.id;
    }

    var _segments;
    _segments[0] = _next_rope;

    var _last_rope = _next_rope;
    var _segment_count = 1;
    repeat (_segments_precision) {
        _next_rope = instance_create_layer(_person1.x + _offset_x * (_segment_count + 1), _person1.y, "Ropes", object_chain_link);

        _link = physics_joint_distance_create(_last_rope, _next_rope, _last_rope.x, _last_rope.y, _next_rope.x, _next_rope.y, false);
        physics_joint_set_value(_link, phy_joint_damping_ratio, 1);
        physics_joint_set_value(_link, phy_joint_frequency, 10);

        with (_next_rope) {
            previous_link = _last_rope;
        }
        _segments[_segment_count] = _next_rope;
        _segment_count++;
        _last_rope = _next_rope;
    }

    var _anchor = instance_create_layer(room_width / 2, room_height / 2, "Instances", object_chain_start);

    var _boulder = instance_create_layer(room_width / 2, room_height / 2, "Instances", object_boulder);

    _link = physics_joint_distance_create(_last_rope, _anchor, _last_rope.x, _last_rope.y, _anchor.x, _anchor.y, false);
    physics_joint_set_value(_link, phy_joint_damping_ratio, 1);
    physics_joint_set_value(_link, phy_joint_frequency, 10);

    _link = physics_joint_distance_create(_anchor, _boulder, _anchor.x, _anchor.y, _boulder.x, _boulder.y, false);
    physics_joint_set_value(_link, phy_joint_damping_ratio, 1);
    physics_joint_set_value(_link, phy_joint_frequency, 10);

    // var _person2 = instance_create_layer(room_width * 0.75, room_height / 2, "Instances", o_Person);
}