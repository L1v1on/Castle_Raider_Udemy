/// @description Player Control
/// Code here will run the set fps times per second

// Get Input
var _left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);
var _up = keyboard_check(vk_up);
var _down = keyboard_check(vk_down);

// Calculate Movement
hsp +=  (_right - _left) * walk_spd;

// Drag - slow player down over time
hsp = lerp(hsp, 0, drag);

// Stop Player
if (abs(hsp) <= 0.1) hsp = 0;

// Facing 1=right, -1=left
if (hsp != 0) facing = sign(hsp);

// Limit Speed
hsp = min(abs(hsp), max_hsp) * facing;

// Apply Movement
x += hsp;
y += vsp;

// Apply Animation
if (hsp != 0) {
	image_xscale = facing;
	sprite_index = s_player_walk;
} else {
	sprite_index = s_player_idle;	
}

