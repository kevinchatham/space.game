# TODO

```
✅ Done
🐞 Bug
💪 Enhancement
```

🐞 Find a way to dynamically assign the right sprite and sprite animation when an asteroid is created. Alternatively, an asteroids animation should be stopped on creation. Then on collision it should play the animation before destroy. You'll still run into this problem when you want to spawn the appropriate resource for collection.

🐞 Mouse cursor directional movement isn't smooth enough. The ship randomly swings around when moving in a circle.
àà
🐞 `spawn_randomly_at()` while loop has a bug where every once in a while `_colliding` is always true so the loop never exits.

💪 Find animated bullet sprite or use a scaled down version of meteor sprites?

💪 Make worm hole progress bar shrink when not clicking it.

💪 Make worm hole spawn you into a new room when progress hits 100%

💪 Make bullets fireable and they should destroy asteroids. This means asteroids need health and healing. 

💪 Add 5 more planets to spawner to decrease the chance of two of them spawning together.