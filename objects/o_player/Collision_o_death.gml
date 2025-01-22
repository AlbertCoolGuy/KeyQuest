//death
	visible = false
	p_lives -= 1;
	if p_lives > 0 {
		room_restart()
		x = (o_startpoint).x
		y = (o_startpoint).y
		visible = true
	}
	else {
		// game over room
		 room_goto(r_death)
	}