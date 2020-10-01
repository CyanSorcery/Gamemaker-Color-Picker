function real_to_hex(real_num) {
	/*
		Converts a real 32bit value to hex
	
		If you use a decimal, it will be rounded
	
		real_num = the value we're turning into a hex
	
		Returns: a string containing the hex
	*/
	///@param real_num

	if (real_num < 0)
	{
		real_num = 0;
	}

	var tmp_num = 0;
	var tmp_hex = "";
	var hex_string = "";

	while (real_num != 0)
	{
		//get our value between 0 and F
		tmp_num = real_num % 16;
	
		//remove this off the stack
		real_num = real_num >> 4;
	
		//get the string
		switch (tmp_num)
		{
			case 0:		{tmp_hex = "0"; break;}
			case 1:		{tmp_hex = "1"; break;}
			case 2:		{tmp_hex = "2"; break;}
			case 3:		{tmp_hex = "3"; break;}
			case 4:		{tmp_hex = "4"; break;}
			case 5:		{tmp_hex = "5"; break;}
			case 6:		{tmp_hex = "6"; break;}
			case 7:		{tmp_hex = "7"; break;}
			case 8:		{tmp_hex = "8"; break;}
			case 9:		{tmp_hex = "9"; break;}
			case 10:	{tmp_hex = "A"; break;}
			case 11:	{tmp_hex = "B"; break;}
			case 12:	{tmp_hex = "C"; break;}
			case 13:	{tmp_hex = "D"; break;}
			case 14:	{tmp_hex = "E"; break;}
			case 15:	{tmp_hex = "F"; break;}
			default:	{tmp_hex = "0"; break;}
		}
		//add it to the total output
		hex_string = tmp_hex + hex_string;
	}

	//return the string
	return hex_string;


}