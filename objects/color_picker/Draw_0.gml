//draw the color
draw_set_color(picked_color);
draw_set_alpha(alpha_slider);
draw_rectangle(0, 0, 720, vert_chunk_size, false);
draw_set_alpha(1);

//draw the chunks
var leftcol, rightcol, hslidepos, hslideval, hslidecol, halign;
for (var col = 0; col < 2; col++)
{
	for (var i = 1; i < 5; i++)
	{
		switch (i)
		{
			case 1:
			{
				if (col == 1)
				{
					//hue
					leftcol			= c_black;
					rightcol		= c_black;
					hslideval		= hue_slider;
				}
				else
				{
					//red
					leftcol			= (blue_val << 16) | (green_val << 8) | $00;
					rightcol		= (blue_val << 16) | (green_val << 8) | $FF;
					hslideval		= red_slider;
				}
				break;
			}
			case 2:
			{
				if (col = 1)
				{
					//sat
					leftcol			= make_color_hsv(color_get_hue(picked_color), $00, color_get_value(picked_color));
					rightcol		= make_color_hsv(color_get_hue(picked_color), $FF, color_get_value(picked_color));
					hslideval		= sat_slider;
				}
				else
				{
					//green
					leftcol			= (blue_val << 16) | ($00 << 8) | red_val;
					rightcol		= (blue_val << 16) | ($FF << 8) | red_val;
					hslideval		= green_slider;
				}
				break;
			}
			case 3:
			{
				if (col = 1)
				{
					//value
					leftcol			= make_color_hsv(color_get_hue(picked_color), color_get_saturation(picked_color), $00);
					rightcol		= make_color_hsv(color_get_hue(picked_color), color_get_saturation(picked_color), $FF);
					hslideval		= val_slider;
				}
				else
				{
					//blue
					leftcol			= ($00 << 16) | (green_val << 8) | red_val;
					rightcol		= ($FF << 16) | (green_val << 8) | red_val;
					hslideval		= blue_slider;
				}
				break;
			}
			case 4:
			{
				//alpha
				leftcol			= (alpha_val << 16) | (alpha_val << 8) | (alpha_val)
				rightcol		= leftcol;
				hslideval		= alpha_slider;
				break;
			}
		}
		
		//don't draw all stats in the bottom right corner as there's nothing to draw
		if (!(i == 4 && col == 1))
		{
			//determine values and colors
			hslidepos = round(360 * hslideval) + (360 * col);
			
			//make color more visible (make hue and sat invert based on val)
			if (
				hslideval > 0.5 
				|| (i == 2 && col == 1 && val_slider > 0.5)
				|| (i == 1 && col == 1 && val_slider > 0.5)
			)
			{
				hslidecol = c_black;
				halign = fa_right;
			}
			else
			{
				hslidecol = c_white;
				halign = fa_left;
			}
			
			//fix alignment for hue
			if (i == 1 && col == 1 && hue_slider > 0.5)
				halign = fa_right;
	
			//draw background
			if (i == 1 && col == 1)
			{
				//draw hue background
				var redcol		= make_color_hsv(0, color_get_saturation(picked_color), color_get_value(picked_color));
				var greencol	= make_color_hsv(round(255 / 3), color_get_saturation(picked_color), color_get_value(picked_color));
				var bluecol		= make_color_hsv(round(255 / 3) * 2, color_get_saturation(picked_color), color_get_value(picked_color));
				
				for (var j = 0; j < 3; j++)
				{
					switch (j)
					{
						case 0:
						{
							leftcol		= redcol;
							rightcol	= greencol;
							break;
						}
						case 1:
						{
							leftcol		= greencol;
							rightcol	= bluecol;
							break;
						}
						case 2:
						{
							leftcol		= bluecol;
							rightcol	= redcol;
							break;
						}
					}
					
					draw_rectangle_color(360 + (120 * j), vert_chunk_size * i, 360 + (120 * (j + 1)), vert_chunk_size * (i + 1), leftcol, rightcol, rightcol, leftcol, false);
				}
			}
			else
			{
				draw_rectangle_color(360 * col, vert_chunk_size * (i), 360 + (360 * col), vert_chunk_size * (i + 1), leftcol, rightcol, rightcol, leftcol, false);
			}
			
			//draw slider sprite
			draw_sprite_ext(hslider_sprite, 0, hslidepos, vert_chunk_size * (i), 1, vert_chunk_size, 0, hslidecol, 1);
	
			//draw slider text
			draw_set_font(small_font);
			draw_set_halign(halign);
			draw_set_valign(fa_middle);
			draw_set_color(hslidecol);
			draw_text(hslidepos, (vert_chunk_size * (i)) + vert_chunk_size / 2, round(hslideval * 255));
		}
		else
		{
			//draw black background for the value strings
			draw_set_color(c_black);
			draw_rectangle(360 * col, vert_chunk_size * (i), 360 + (360 * col), vert_chunk_size * (i + 1), false);
		}
	}
}

//draw the values as strings
draw_set_color(c_white);
draw_set_font(small_font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var gamemakerstr	= "Gamemaker:   $" + pad_string(real_to_hex(picked_color), 8, "0");
var hexcodecol		= "HTML Hex:    #";
hexcodecol			+= pad_string(real_to_hex(red_val), 2, "0");
hexcodecol			+= pad_string(real_to_hex(green_val), 2, "0");
hexcodecol			+= pad_string(real_to_hex(blue_val), 2, "0");
hexcodecol			+= "  ";
var bottomtext		= (copied_timer > 0 ? "Copied to clipboard!!!!!" : "Right Click to Copy GML Hex Code");
bottomtext			+= "\r\nLeft Click here to enter color string";
var final_str		= gamemakerstr + "\r\n" + hexcodecol + "\r\n\r\n" + bottomtext;

draw_text((360 / 2) + 360, (vert_chunk_size * 4) + (vert_chunk_size / 2), final_str);