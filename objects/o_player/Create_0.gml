//start
visible = true

//moving
moveDir = 0;
moveSpd = 8;
xspd = 0;
yspd = 0;

//jumping
grav = .775;
termVel = 20;
//jump hight (first, second jump)
jspd = [-14.15,-10.15]
//amount of jumps
jumpMax = 2;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames = [18,10]
//frames before you hit the ground, where the jump still counts
bufferTime = 6;
jumpKeyBuffered = 0;
jumpKeyBufferTimer = 0;
//ground check
onGround = true; 
//lives
p_lives = 3;
//keys
keys_collected = 0;
switch (room) {
	case Room1:
		keys_needed = 2
	break;
	
	default:
		keys_needed = 0
}
