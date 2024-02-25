is_visible = false;

g_width = display_get_gui_width();
g_height = display_get_gui_height();

inventory_columns = 2;
inventory_rows = 2;
window_padding_x = 32;
window_padding_y = 32;
sprite_padding_x = 16;
sprite_padding_y = 16;

slot_sprite_w = sprite_get_width(spr_inventory_slot);
slot_sprite_h = sprite_get_height(spr_inventory_slot);
initial_padding_x = window_padding_x + sprite_padding_x;
initial_padding_y = window_padding_y + sprite_padding_y;
inventory_width =
  window_padding_x +
  sprite_padding_x * (inventory_columns + 1) +
  slot_sprite_w * (inventory_columns - 1);
inventory_height =
  window_padding_y + sprite_padding_y * (inventory_rows + 1) + slot_sprite_h * (inventory_rows - 1);

inventory = new Inventory(inventory_columns * inventory_rows);
inventory.inventory_load();

recipe = new Recipe(
  "DISPLAYNAME",
  [new InventoryItem(global.item_cobalt, 1)],
  [new InventoryItem(global.item_coal, 1)],
  spr_resource_coal
);

station = new Station([recipe]);
