var rightKey, leftKey, jumpKey, jumpKeyPressed
 rightKey = keyboard_check( ord("D") ) + keyboard_check( vk_right );
    rightKey = clamp(rightKey, 0, 1)
    leftKey = keyboard_check( ord("A") ) + keyboard_check( vk_left );
    leftKey = clamp(leftKey, 0, 1)

    jumpKeyPressed = keyboard_check_pressed( vk_space );
    jumpKey = keyboard_check( vk_space );
    // jump buffering
    if jumpKeyPressed
    {
        jumpKeyBufferTimer = bufferTime;
    }
    if jumpKeyBufferTimer > 0 
    {
        jumpKeyBuffered = 1;
        jumpKeyBufferTimer--;
    } else {
        jumpKeyBuffered = 0;
    }

//x move
//dir
moveDir = rightKey - leftKey;
// dir spr change
if moveDir < 0 {
	sprite_index = sprKnight_Run;
	image_xscale = -1;
} else if moveDir > 0 {
	sprite_index = sprKnight_Run;
	image_xscale = 1;
} else if moveDir == 0 {
	sprite_index = sprKnight_Idle;
}

//get xspd
xspd = moveDir * moveSpd;
//x collision
var _subPixel = .5;
if place_meeting(x + xspd, y , o_solid){
    //wall
    var _pixelCheck = _subPixel * sign(xspd);
    while !place_meeting( x + _pixelCheck, y, o_solid)
    {
        x += _pixelCheck;
    }

    //reset x
    xspd = 0;
}

var dir
//move
x += xspd;

//y move
    //grav
    yspd += grav;

    //grav cap
    if yspd > termVel { yspd = termVel;};
	//reset jumpcount
	  if onGround {
        jumpCount = 0 ; 
	//bug fix for when you try to jump but cant because of a collision and the game crashes
        jumpHoldTimer = 0;
    } else {
        if jumpCount == 0 { jumpCount = 1};
    }
   // jump
    if jumpKeyBuffered && jumpCount < jumpMax
    {
        //reset jump buffer
        jumpKeyBuffered = false;
        jumpKeyBufferTimer = 0;
        jumpCount++;
        jumpHoldTimer = jumpHoldFrames[jumpCount-1];
    }
    //cut of jump
    if !jumpKey {
         jumpHoldTimer = 0;
    }
    // jump hight based on key hold time
    if jumpHoldTimer > 0 {
        //set yspd to jspd each frame
        yspd = jspd[jumpCount -1];
        //count timer down
        jumpHoldTimer--;
    }

   //y collision
if place_meeting( x, y +yspd, o_solid )
{
    //floor
    var _pixelCheck = _subPixel * sign(yspd);
    while !place_meeting( x, y + _pixelCheck, o_solid)
    {
        y += _pixelCheck;
    }

    //loss jump momentum when you hit your head
    if yspd < 0 {
        jumpHoldTimer = 0;
    }
    //reset y
    yspd = 0;
}
    //check if on ground
    if yspd >= 0 && place_meeting(x,y+1, o_solid) {
        onGround = true;
    } else {
        onGround = false;
    }
    //up
    y += yspd; 




