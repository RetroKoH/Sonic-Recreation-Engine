function scr_number_lead_zero(val,num){
	// This will draw numerical HUD values up to a certain length, all while drawing 0s before it for empty placeholders.

	var number_string, zeros_string;	// Set the variable for the numbers, and placeholder zeroes.
	number_string = string(val);		// This sets the number string to whatever number needs to be typed.
	zeros_string  = "";					// Zero string is empty, for now.

	// Add all necessary 0    
	for (var i=0; i<(num-string_length(number_string)); i+=1)	// i is increased by one, until it reaches the desired length of zeroes, - the numerical value.
	    zeros_string += "0";									// a zero is now added to every empty space to fill the length desired.

	// Return
	return zeros_string+number_string;	// The finished text is now returned, with the zeroes, followed by your actual number.
}