function scr_file_bin_read_ext(file,count,endian,signed){
	// Extended binary reading mechanism. NOTE - Taken from Sonic Triad, and used merely for construction of some data structures used in the game.
	// Argument0 is the binary file being read.
	// Argument1 is the number of bytes being read from the file.
	// Argument2 tells whether to read in little or big-endian. (0: Big-endian, 1: little-endian)
	// Argument3 tells whether the resulting number is signed. (0: Unsigned, 1: Signed)

	var ret; ret=0; // Real value returned.

	    if !(endian) // BIG ENDIAN (0)
	    {
	        var shift; shift=8*(count-1);   // The amount to shift the bits of the number. Decreases with every count.
	        repeat(count)
	        {
	            ret+=file_bin_read_byte(file)<<shift;
	            shift-=8;
	        }
	    }
	    else // LITTLE ENDIAN (1)
	    {
	        var shift; shift=0;             // The amount to shift the bits of the number. Increases with every count.
	        repeat(count)
	        {
	            ret+=file_bin_read_byte(file)<<shift;
	            shift+=8;
	        }
	    }

	if (signed)
	{
	    if ret&($80<<(8*(count-1))) return ret-($100<<(8*(count-1))); // Return negative value if needed.
	}

	return ret; // Otherwise, return value as is.
}