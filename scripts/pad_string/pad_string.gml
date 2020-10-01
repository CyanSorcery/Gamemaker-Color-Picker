
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