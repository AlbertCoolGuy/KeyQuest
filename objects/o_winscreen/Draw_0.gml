var c_gold = #d4af37 
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text_color(room_width/2, room_height/2, "Du har vundet!", c_gold, c_gold, c_gold, c_gold, 100)
draw_text_transformed_color(room_width/2, room_height/1.5, string("Du havde {0} liv tilbage!", (o_player).p_lives), 0.4, 0.4, 0,  c_green, c_green, c_green, c_green, 100) 