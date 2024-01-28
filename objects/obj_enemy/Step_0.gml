//// In the Step Event of your enemy object

//// Calculate direction to the player
var directionToPlayer = point_direction(x, y, obj_ship.x, obj_ship.y);

//// Calculate distance to the player
var distanceToPlayer = point_distance(x, y, obj_ship.x, obj_ship.y);

//// Initialize steering direction
var steeringDirection;

//// Check if the player is within the pursuit distance
//if (distanceToPlayer > maxDistance) {
////    // Pursuit behavior: move towards the player
//    steeringDirection = directionToPlayer;
//} else {
////    // Evasion behavior: move away from the player
//    steeringDirection = directionToPlayer + 180;
//}

//// Add some noise to the steering direction
//steeringDirection += random_range(-10, 10);

//// Turn towards the calculated steering direction
image_angle = (directionToPlayer + 270)%360; //angle_difference(direction, directionToPlayer) * turnSpeed;

move_towards_point(obj_ship.x, obj_ship.y, max_speed);
