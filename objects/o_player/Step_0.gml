rightKey = keyboard_check( vk_right );
leftKey = keyboard_check( vk_left );
jumpKeyPressed = keyboard_check_pressed( vk_space );
jumpKey = keyboard_check( vk_space )
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
if place_meeting(x + xspd, y , o_solid)
{
    //wall
    var _pixelCheck = _subPixel * sign(xspd);
    while !place_meeting( x + _pixelCheck, y, o_solid)
    {
        x += _pixelCheck;
    }

    //reset x
    xspd = 0;
}

//move
x += xspd;

//y move
    //grav
    yspd += grav;

    //grav cap
    //if y > termVel { yspd = termVel;};

    // jump
    if jumpKeyPressed  && place_meeting (x , y +1, o_solid)
    {
        yspd = jspd;
    }

    //y collision
    var _subPixel = .5;
    if place_meeting( x, y +yspd, o_solid )
    {
        //floor
        var _pixelCheck = _subPixel * sign(yspd);
        while !place_meeting( x, y + _pixelCheck, o_solid)
        {
            y += _pixelCheck;
        }

        //reset y
        yspd = 0;
    }

    //up
    y += yspd;
	

//death
if place_meeting(x,y, o_death){
	game_restart()
}
	
//level switch
if place_meeting(x,y,o_level_switch) {
	if room = Room1 {
		room_goto(Room2) 
		x = 70
		y = 530
	} else if room = Room2 and x<200 {
		room_goto(Room1)
		x = 1230
		y = 230
	} else if room=Room2 and x>600 {
		room_goto(Room3)
		x = 92
		y = 530
	} else if room = Room3 {
		room_goto (Room2)
		x = 1275
		y = 350
	}
}