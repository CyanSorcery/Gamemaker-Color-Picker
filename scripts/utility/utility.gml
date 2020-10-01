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

function hex_to_real(hex_num) {
	/*
		Turns a hex encoded string into a real number
	
		WARNING
		Try to limit this to 32bit ints, or else who knows what'll happen
	
		hex_num			The string containing the hex values
	
		returns				The real number
	*/
	///@param hex_value

	//how long is this string?
	var str_len = string_length(hex_num);

	//parse the string
	var to_return = 0;
	var tmp_real = 0;

	var one_char = "";


	for (var i = 1; i <= str_len; i++)
	{
		//fetch four bits (0 - F)
		one_char = string_copy(hex_num, str_len - i + 1, 1);
	
		//find out what it is
		switch (one_char)
		{
			case "F":				{tmp_real = 15; break;}
			case "E":				{tmp_real = 14; break;}
			case "D":				{tmp_real = 13; break;}
			case "C":				{tmp_real = 12; break;}
			case "B":				{tmp_real = 11; break;}
			case "A":				{tmp_real = 10; break;}
			case "9":				{tmp_real = 9; break;}
			case "8":				{tmp_real = 8; break;}
			case "7":				{tmp_real = 7; break;}
			case "6":				{tmp_real = 6; break;}
			case "5":				{tmp_real = 5; break;}
			case "4":				{tmp_real = 4; break;}
			case "3":				{tmp_real = 3; break;}
			case "2":				{tmp_real = 2; break;}
			case "1":				{tmp_real = 1; break;}
			case "0":
			default:				{tmp_real = 0; break;}
		}
	
		//offset it by the right amount
		if (i > 1)
			tmp_real *= 1 << ((i - 1) * 4);
	
		//put it into the final value
		to_return += tmp_real;
	
	}


	//return the converted number
	return to_return;


}


function pad_string(_str, _length, _chr)
{
	/*
		Pad a string to length characters with character _chr
		
		If it's too long it'll simply be returned
	*/
	///@param string
	///@param length
	///@param char
	
	//clamp the new length
	_length = clamp(real(_length), 1, 8);
	
	//get the current length
	var currlen = string_length(_str);
	
	//get the new size
	var newlen = max(_length - currlen, 0);
	
	//return the result
	return (string_repeat(_chr, newlen) + _str);
}