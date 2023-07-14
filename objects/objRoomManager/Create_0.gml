/// @description Init the data for room selection
randomize();

//All the rooms you can warp to
possibleRooms = 
[
	//First entry is room, second is x pos, third is y pos
	[rmLevel2, 200, 320],
	[rmLevel3, 200, 320],
	[rmLevel5, 200, 320],
	[rmLevel4, 200, 320]
];

//The order of the levels
levels = [];

//Choose the order now and delete when you choose one
var length = array_length(possibleRooms);
for(var i = 0; i < length; ++i) {
	var num = irandom(array_length(possibleRooms) - 1);
	levels[i] = possibleRooms[num];
	array_delete(possibleRooms, num, 1);
}

//Can also shuffle like this
//levels = array_shuffle(possibleRooms);

counter = 0;
lastRoom = undefined;
startingRoom = rmStart; //Must specify, because if we put this in the list it will get shuffled around
endingRoom = array_last(levels);

//Make a warp to the next room int he list
function CreateWarpTo(newRoom) {
	instance_create_layer(room_width - 16, room_height / 2, "Instances", objWarp, {
		nextRoom : newRoom,
		xPos : levels[counter][1],
		yPos : levels[counter][2],
		counterChange : +1
	});
}

//Create a warp to the previous room in the list
function CreateWarpBack(oldRoom) {
	instance_create_layer(16, room_height / 2, "Instances", objWarp, {
		nextRoom : oldRoom,
		xPos : room_width - 150,
		yPos : room_height / 2,
		counterChange : -1
	});
}