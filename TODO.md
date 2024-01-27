# TODO

```
✅ Done
🧪 Needs Testing
🐞 Bug
💪 Enhancement
```

💪 Make worm hole spawn you into a new room when progress hits 100%

💪 Make a cooler ship.

💪 Allow swapping between different ships.

💪 Add pause feature.

💪 Add main menu.

---

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

✅💪 Use Tab to switch between keyboard control and mouse cursor control.

✅💪 Make asteroid death spawn a certain resource by expanding asteroid type.

✅💪 Make worm hole progress bar shrink when not clicking it.

✅💪 Make bullets fire from ship and they should destroy asteroids.

✅💪 Find bullet sprite

✅💪 Replace arrow with compass with single arrow. Layer them on top of each other and point them in different directions toward different resources.

✅💪 Asteroids need health and healing.

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
