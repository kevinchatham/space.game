function Game() constructor {
  /// @param {Id.Layer} _layer
  start = function(_layer) {
    // globals for resources
    build_items();
    build_asteroid_types();
    build_recipies();

    // player options
    build_options();

    // build space
    build_particle_systems(_layer);
    build_rm_space(4096);
    build_layers_and_instances();
  };

  build_recipies = function() {
    global.recipe = new Recipe(
      "DISPLAYNAME",
      [new InventoryItem(global.item_cobalt, 1)],
      [new InventoryItem(global.item_coal, 1)],
      spr_resource_coal
    );
  };

  build_asteroid_types = function() {
    global.asteroid_type_coal = new AsteroidOptions(
      spr_asteroid,
      5, // health
      100, // spawn chance
      // next spawns
      [{item: global.item_coal, quantity: 3}]
    );

    global.asteroid_type_cobalt = new AsteroidOptions(
      spr_asteroid_cobalt,
      5, // health
      100, // spawn chance
      // next spawns
      [{item: global.item_cobalt, quantity: 3}]
    );

    global.asteroid_type_ice = new AsteroidOptions(
      spr_asteroid_ice,
      5, // health
      100, // spawn chance
      // next spawns
      [{item: global.item_ice, quantity: 3}]
    );

    /// @type {Array<Struct.AsteroidOptions>}
    global.asteroid_types = [
      global.asteroid_type_coal,
      global.asteroid_type_cobalt,
      global.asteroid_type_ice
    ];
  };

  build_items = function() {
    global.item_coal = new Item("Coal", spr_resource_coal);
    global.item_ice = new Item("Ice", spr_resource_ice);
    global.item_cobalt = new Item("Cobalt", spr_resource_cobalt);
  };

  build_options = function() {
    global.despawn_lifetime = 60;
    global.thruster_particle_emitter_particle_count = 3;
    global.master_volume = 1;
    global.music_volume = 0.2 * global.master_volume;
    global.effect_volume = 0.2 * global.master_volume;

    window_set_cursor(cr_none);
    cursor_sprite = spr_none;

    audio_play_sound(snd_ambiance, 1, true, global.music_volume);
  };

  /// @param {Id.Layer} _layer
  build_particle_systems = function(_layer) {
    global.particle_system = part_system_create_layer(_layer, true);
    global.thruster_particle_emitter = part_emitter_create(global.particle_system);
    global.thruster_particle_type = part_type_create();

    part_system_global_space(global.particle_system, true);
    part_system_depth(global.particle_system, 0);

    part_type_color2(global.thruster_particle_type, c_aqua, c_blue);
    part_type_shape(global.thruster_particle_type, pt_shape_pixel);
    part_type_size(global.thruster_particle_type, 1, 1, 0, 0);

    part_emitter_stream(
      global.particle_system,
      global.thruster_particle_emitter,
      global.thruster_particle_type,
      global.thruster_particle_emitter_particle_count
    );
  };

  /// @param {Real} _size
  build_rm_space = function(_size) {
    room_set_width(rm_space, _size);
    room_set_height(rm_space, _size);
  };

  build_layers_and_instances = function() {
    layer_set_target_room(rm_space);

    global.ui_focus_layer = layer_create(-2, "Focus");
    global.ui_layer = layer_create(-1, "UI");
    global.main_layer = layer_create(0, "Main");
    global.planet_layer = layer_create(1, "Planets");
    global.star_layer = layer_create(2, "Stars");

    var _space_camera_id = room_instance_add(rm_space, 0, 0, obj_space_camera);
    var _spawner_id = room_instance_add(rm_space, 0, 0, obj_spawner);
    var _resource_arrow_id = room_instance_add(rm_space, 0, 0, obj_arrow_resource);
    var _worm_hole_arrow_id = room_instance_add(rm_space, 0, 0, obj_arrow_worm_hole);
    var _enemy_arrow_id = room_instance_add(rm_space, 0, 0, obj_arrow_enemy);
    var _ship_id = room_instance_add(rm_space, room_height / 2, room_width / 2, obj_ship);
    var _ship_inventory_id = room_instance_add(rm_space, 0, 0, obj_inventory_ship);
    var _station_furnace_id = room_instance_add(
      rm_space,
      room_height / 2,
      room_width / 2 - 125,
      obj_station_furnace
    );

    layer_add_instance(global.main_layer, _ship_id);
    layer_add_instance(global.main_layer, _station_furnace_id);
    layer_add_instance(global.ui_layer, _resource_arrow_id);
    layer_add_instance(global.ui_layer, _worm_hole_arrow_id);
    layer_add_instance(global.ui_layer, _enemy_arrow_id);
    layer_add_instance(global.ui_layer, _ship_inventory_id);
    layer_add_instance(global.ui_layer, _station_furnace_id);

    layer_reset_target_room();
  };
}

// ! Destroy particle systems
// part_type_destroy(global.thruster_particle_type);
// part_emitter_destroy(global.particle_system, global.thruster_particle_emitter);
// part_system_destroy(global.particle_system); 
