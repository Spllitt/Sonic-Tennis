draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(display_get_gui_width() * 0.5, 24, string(global.SCORE) + "  x  " + string(global.oppSCORE));
if (global.ROUNDtext != "") draw_text(display_get_gui_width() * 0.5, 56, global.ROUNDtext);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
