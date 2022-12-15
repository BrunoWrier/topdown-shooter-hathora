// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Message Type
enum ClientMessageType{
	SetDirection,
	SetAngle,
	Shoot,
	Ping
}

// Direction
enum Direction{
	None,
	Up,
	Down,
	Left,
	Right
}