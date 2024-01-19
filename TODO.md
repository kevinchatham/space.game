# TODO

```
✅ Done
🧪 Needs Testing
🐞 Bug
💪 Enhancement
```

🐞 Find a way to dynamically assign the right sprite and sprite animation when an asteroid is created. Alternatively, an asteroids animation should be stopped on creation. Then on collision it should play the animation before destroy. You'll still run into this problem when you want to spawn the appropriate resource for collection.

🧪 Mouse movement isn't smooth enough. The ship shakes.

- Fixed but needs clean up.
- Implemented a proper dead zone since 180 degrees means the ship is pointed straight at the cursor.

💪 Find animated bullet sprite or use a scaled down version of meteor sprites?

💪 Make worm hole progress bar shrink when not clicking it.

💪 Make worm hole spawn you into a new room when progress hits 100%

💪 Make bullets fireable and they should destroy asteroids. This means asteroids need health and healing.

💪 Add 5 more planets to spawner to decrease the chance of two of them spawning together.

💪 Replace arrow with compass with single arrow. Layer them on top of each other and point them in different directions toward different resources.

💪 Make a cooler ship.

💪 Allow swapping between different ships.

💪 Allow flipping between bullets and tractor beam.

💪 Create inventory for ship.

💪 Create a weighted system to allow rarity among spawning asteroid types.

💪 Build save and load system.

🧪 `spawn_randomly_at()` while loop may still have a bug where every once in a while `_colliding` is always true so the loop never exits. Since simplifying the conditional it has made some improvement.

---

✅💪 Use Tab to switch between keyboard control and mouse cursor control.

- Done, is very nice.

✅🐞 The ship randomly swings around when moving in a circle.

- A better directional mechanism was calculated so the ship swings smoothly in all rotations.

✅🐞 The ship slides around when using keyboard or following the cursor.

- The control mechanism for keyboard and mouse steering was drastically improved. The ship no longer slides around
