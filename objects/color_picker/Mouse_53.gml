//set which one to change
val_to_change = min(floor(mouse_y / vert_chunk_size), 5);
col_to_change = clamp(floor(mouse_x / 360), 0, 1);