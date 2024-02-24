```
✅ Done
🧪 Needs Testing
🐞 Bug
💪 Enhancement
```

# TODO

### Environment

💪 More planets.

💪 Add an iron asteroid type.

💪 Better asteroid art and animations.

### Camera

💪 Create a minimap alongside the arrow navigation system.

💪 Alternatively, create a radar system similar to Satisfactory.

### Player

💪 Clean up inventory object code.

💪 Clean up mouse object code.

💪 Create a max count for inventory items.

💪 Add ammo count to player ship.

💪 Implement player death and a restart / inventory loss system.

💪 Add a fuel system to the player ship.

💪 Add UI for ship fuel and health.

💪 Better ship art and animations for explosion.

💪 Allow swapping between different ships.

### Enemy

💪 Enemy ships should spawn on a layer above or a layer below the player ship / astroid layer so it looks like they are flying under or over it.

💪 Balance enemy spawning so the player is never overwhelmed.

💪 Enemy ships need particles.

💪 Enemy spawner should alternate between spawning single units and small groups.

💪 Enemy ships need to have animated explosions.

💪 Enemies need to shoot at player?

💪 Better ship art and animations for explosion.

### Game

💪 Implement timer based periodic save because saving on escape is annoying.

💪 Add pause feature.

💪 Add main menu.

# DONE

✅🐞 Collision sound plays multiple times and is very annoying.

✅🐞 The ship randomly swings around when moving in a circle.

- A better directional mechanism was calculated so the ship swings smoothly in all rotations.

✅🐞 The ship slides around when using keyboard or following the cursor.

- The control mechanism for keyboard and mouse steering was drastically improved. The ship no longer slides around

✅🐞 Mouse movement isn't smooth enough. The ship shakes.

- Implemented a proper dead zone since 180 degrees means the ship is pointed straight at the cursor.

✅🐞 `spawn_randomly_at()` while loop may still have a bug where every once in a while `_colliding` is always true so the loop never exits. Since simplifying the conditional it has made some improvement.

- Simplifying the condition and introducing an upper limit seems to do the trick.

✅🐞 Find a way to dynamically assign the right sprite and sprite animation when an asteroid is created. Alternatively, an asteroids animation should be stopped on creation. Then on collision it should play the animation before destroy. You'll still run into this problem when you want to spawn the appropriate resource for collection.

- I figured out how to use structs here and added one for asteroid and another function to create a random asteroid struct for reference in the asteroid object.

✅🐞 `spawn_randomly_at()` bug is still present and will cause the game to freeze occasionally.

- Yea I'm dumb and the spawner wasn't actually hitting the loop limiting condition.

✅🐞 Asteroid collision sound sometimes plays outside of viewport.

- Added optional padding to `inside_view_port()` function.

✅🐞 Planets sometimes spawn inside of view port.

- Added optional padding to `inside_view_port()` function.

✅🐞 Fix object spawning.

- The inside_view_port() function was all out of whack. Now it corresponds directly to the view port as it should.

- Also the padding variable was all out of whack and not applying correctly. Now positive padding value pad away from the viewport and not inside of it. Meaning you don't have to provide negative values everywhere.

✅🐞 Fix mouse control so it is separated from opening the inventory. You should be able to fly around with mouse control even if the inventory is open.

- Also, generally speaking, mouse control is much better because aiming is hard if you don't have it.

- Moved inventory to I and mouse control to Tab

✅🐞 You should be able to move an inventory item into an empty slot. Currently it dumps out in the world.

- I added an empty inventory item to pad out the array. This way an inventory is filled with empty slots and you can swap a real slot with any empty slot to move an item around the inventory.

- Then I made it impossible to drag around or highlight an empty item so the inventory behaves naturally.

- Empty slots are never written to the save file. The inventory is just padded out on load to fill the maximum count of slots. This will have to be slightly refactored when different inventories are introduced.

✅🐞 Bugs with camera and spawning system.

- Fade in on game load instead of camera pan.

- Space color slightly changed.

- Spawning fixes that allows for more consistent spawning as well as control over initial viewport spawning.

- By default you are zoomed out now.

- Game window starts relative to display width and height.

✅🐞 Enemies should not be able to fly behind plants. Generally this isn't working correctly even though the code seems to be ok. Maybe switch to using depth instead of layers? Really it's quite odd.

- Layer depth manually set on room initialization.

✅🐞 Stars should be behind planets layer wise.

✅🐞 Sometimes duplicate planets spawn near each other. Maybe change the algorithm so it always picks a new planet by remembering the last few planets spawned?

- Used while instance_nearest() to keep looping through planet sprites until the sprite is not equal to the nearest planet.

✅🐞 Planets cause the spawn port limiter to hit its max and then the planet often spawns randomly in the view port.

- Here I'm just returning early so the planet doesn't spawn at all. I also decreased the amount of planets in the spawn port which is more realistic.

✅🐞 It's possible to select and drag an inventory item when the inventory isn't visible.

- You can no longer do this. Also inventory bugs were fixed pertaining to the creation of empty slots. We use a random generated string now.

✅💪 Use Tab to switch between keyboard control and mouse cursor control.

✅💪 Make asteroid death spawn a certain resource by expanding asteroid type.

✅💪 Make worm hole progress bar shrink when not clicking it.

✅💪 Make bullets fire from ship and they should destroy asteroids.

✅💪 Find bullet sprite

✅💪 Replace arrow with compass with single arrow. Layer them on top of each other and point them in different directions toward different resources.

✅💪 Asteroids need current_health and healing.

✅💪 Create inventory for ship.

✅💪 Build ship inventory save and load system.

✅💪 Destroy items when dragged outside of inventory.

- This should spawn the number of resources where the mouse cursor is when the mouse is released.
- The resources should destroy themselves after some time. This allows the player to pick them back up.

✅💪 Add 5 more planets to spawner to decrease the chance of two of them spawning together.

✅💪 Create a weighted system to allow rarity among spawning asteroid types.

- Added rarity value to Asteroid struct that corresponds to the percent chance that asteroid type has a chance to spawn.

✅💪 Bullet sounds

✅💪 Resource pickup sounds

✅💪 Better collision sounds

✅💪 Create an effect volume option to pair with global volume.

✅💪 Make worm hole spawn you into a new room when progress hits 100%.

✅💪 Add worm hole sound effects.

✅💪 Make worm hole progress bar rounded.

✅💪 Add enemy / bullets / health / healing.

✅💪 Add ship health.

✅💪 Improve enemy attack movement / logic.

✅💪 Improve enemy idle patterns.

✅💪 Add enemy spawning.

✅💪 Add arrow for nearest offscreen enemy.

✅💪 Add some noise to enemy movement... maybe based on sin wave, perlin noise, etc.

- This could probably be better but I'm tired of messing with sin functions.

✅💪 Allow zooming with mouse wheel and cleanup of camera code.

✅💪 Move all camera and spawn related code from script into obj_space_camera so it is all self contained.

✅💪 Enemy ships should gradually speed up when attacking / retreating from the player.

✅💪 Make speed of enemy based on speed of ship.

✅💪 Detonate enemies after a certain period of attacking so they don't chase you for forever.

✅💪 Enemy balancing / tuning.

✅💪 Enemy ships need to damage player when the player runs into them.

✅💪 Asteroids need to damage player when the player runs into them.
