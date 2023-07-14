/// @description Warp into the next room

x = other.xPos;
y = other.yPos;
room_goto(other.nextRoom);
//Increase or decreases counter
objRoomManager.counter += other.counterChange;