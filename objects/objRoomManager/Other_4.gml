/// @description Create Warps

//Edge case of starting in the first room
//We only want 1 warp to the next room
if (room == startingRoom) {
	CreateWarpTo(levels[counter][0]);
	show_debug_message("Edge Case 1");
}
//Edge case of last room in list
//We only want the warp back
else if (room == levels[array_length(levels) - 1][0]) {
	CreateWarpBack(lastRoom);
	show_debug_message("Edge Case 2");
}
//Edge case of the room going back to start
//Create the warp back specifically to the starting room
else if (room == levels[0][0]) {
	CreateWarpBack(startingRoom);
	CreateWarpTo(levels[counter][0]);
	show_debug_message("Edge Case 3");
}
//Every other room in between
else {
	CreateWarpTo(levels[counter][0]);
	//Not sure why, but this counter needs to be - 2 to find the right room
	CreateWarpBack(levels[counter - 2][0]);
	show_debug_message("Not an edge case");
}