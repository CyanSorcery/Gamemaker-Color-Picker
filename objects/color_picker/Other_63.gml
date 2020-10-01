//Did the user give us a color?
var our_id = ds_map_find_value(async_load, "id");
if (our_id == async_msg_id)
{
	if (ds_map_find_value(async_load, "status"))
	{
		if (ds_map_find_value(async_load, "result") != "")
		{
			picked_color = hex_to_real(ds_map_find_value(async_load, "result"));
			
			//update sliders
			red_slider		= color_get_red(picked_color) / 255;
			green_slider	= color_get_green(picked_color) / 255;
			blue_slider		= color_get_blue(picked_color) / 255;
			alpha_slider	= (picked_color >> 24) / 255;
			
			hue_slider		= color_get_hue(picked_color) / 255;
			sat_slider		= color_get_saturation(picked_color) / 255;
			val_slider		= color_get_value(picked_color) / 255;
			
			//update colors
			red_val			= clamp(round($FF * red_slider), $00, $FF);
			green_val		= clamp(round($FF * green_slider), $00, $FF);
			blue_val		= clamp(round($FF * blue_slider), $00, $FF);
			alpha_val		= clamp(round($FF * alpha_slider), $00, $FF);
		}
	}
	
	async_msg_id = -1;
}