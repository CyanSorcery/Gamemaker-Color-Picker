#region Change RGB values
if (col_to_change == 0)
{
	var h_slide = clamp(mouse_x / 360, 0, 1);

	switch (val_to_change)
	{
		case 1:
		{
			//red slider
			red_slider = h_slide;
			break;
		}
		case 2:
		{
			//green slider
			green_slider = h_slide;
			break;
		}
		case 3:
		{
			//blue slider
			blue_slider = h_slide;
			break;
		}
		case 4:
		{
			//alpha slider
			alpha_slider = h_slide;
			break;
		}
	}
	

	//update color value
	picked_color = (alpha_val << 24) | (blue_val << 16) | (green_val << 8) | red_val;
	
	
	hue_slider = color_get_hue(picked_color) / 255;
	sat_slider = color_get_saturation(picked_color) / 255;
	val_slider = color_get_value(picked_color) / 255;
}
#endregion

#region Change HSV values
if (col_to_change == 1)
{
	var h_slide = clamp(mouse_x / 360, 1, 2) - 1;

	switch (val_to_change)
	{
		case 1:
		{
			//hue slider
			hue_slider = h_slide;
			break;
		}
		case 2:
		{
			//sat slider
			sat_slider = h_slide;
			break;
		}
		case 3:
		{
			//val slider
			val_slider = h_slide;
			break;
		}
	}
	
	//update color
	picked_color	= (alpha_val << 24) | make_color_hsv(floor(hue_slider * 255), floor(sat_slider * 255), floor(val_slider * 255));
	
	//update colors
	red_slider		= color_get_red(picked_color) / 255;
	green_slider	= color_get_green(picked_color) / 255;
	blue_slider		= color_get_blue(picked_color) / 255;
}
#endregion


//update slider values
red_val			= clamp(round($FF * red_slider), $00, $FF);
green_val		= clamp(round($FF * green_slider), $00, $FF);
blue_val		= clamp(round($FF * blue_slider), $00, $FF);
alpha_val		= clamp(round($FF * alpha_slider), $00, $FF);