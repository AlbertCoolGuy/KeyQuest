draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_game)
var color = c_black
var controls_color = c_red
var logo_color = #B5B7BB
draw_text_transformed_color(room_width/2, room_height/3, "KeyQuest", 3, 3, 0, c_silver, c_silver, c_silver, c_silver, 100)
draw_text_transformed_color(room_width/2, room_height/1.5, "Tryk Space for at hoppe, to gange for at dobbelthoppe. Piletaster eller WASD for at move.", 0.25,0.25,0, controls_color,controls_color,controls_color,controls_color,100)
draw_text_transformed_color(room_width/2, room_height/1.2, "Tryk en tast for at starte",0.5 ,0.5, 0, color, color, color, color,100)