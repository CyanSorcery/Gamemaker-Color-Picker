//set which one to change
val_to_change = min(floor(mouse_y / vert_chunk_size), 4);
col_to_change = clamp(floor(mouse_x / 360), 0, 1);

//if it's the bottom left, prompt for a color
if (val_to_change == 4 && col_to_change == 1)
{
	async_msg_id = get_string_async("Please input a Gamemaker color string (WITHOUT the $, please)", pad_string(real_to_hex(picked_color), 8, "0"));
}