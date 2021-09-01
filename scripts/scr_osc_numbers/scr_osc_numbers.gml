function scr_osc_num_init(){
	globalvar osc_active; osc_active = false;
	// Oscillitary Variables - These dictate movement of some objects/graphics. NOT all are running in all levels. You can change this in "scrOscNumDo".
	// +2 - MZ & LZ
	globalvar osc_0a;           osc_0a=.5;          // Actual value. Starts at this baseline.
	globalvar osc_0b;           osc_0b=0;           // Value that "a" is increased/decreased by.
	globalvar inc_0;            inc_0=.0078125;     // Amount that "b" increments by.
	globalvar lim_0;            lim_0=.4921875;     // polarity is reversed when "b" reaches this value.
	globalvar pol_0;            pol_0=1;            // polarity of var "b".
	// +6 - MZ & SBZ
	globalvar osc_1a;           osc_1a=.5;          // Actual value. Starts at this baseline.
	globalvar osc_1b;           osc_1b=0;           // Value that "a" is increased/decreased by.
	globalvar inc_1;            inc_1=.0078125;     // Amount that "b" increments by.
	globalvar lim_1;            lim_1=.609375;      // polarity is reversed when "b" reaches this value.
	globalvar pol_1;            pol_1=1;            // polarity of var "b".
	// +$A - MZ, SYZ, LZ, SLZ
	globalvar osc_2a;           osc_2a=.5;          // Actual value. Starts at this baseline.
	globalvar osc_2b;           osc_2b=0;           // Value that "a" is increased/decreased by.
	globalvar inc_2;            inc_2=.0078125;     // Amount that "b" increments by.
	globalvar lim_2;            lim_2=.703125;      // polarity is reversed when "b" reaches this value.
	globalvar pol_2;            pol_2=1;            // polarity of var "b".
	// +$E - GHZ, MZ, SYZ, LZ, SLZ, SBZ
	globalvar osc_3a;           osc_3a=.5;          // Actual value. Starts at this baseline.
	globalvar osc_3b;           osc_3b=0;           // Value that "a" is increased/decreased by.
	globalvar inc_3;            inc_3=.0078125;     // Amount that "b" increments by.
	globalvar lim_3;            lim_3=.859375;      // polarity is reversed when "b" reaches this value.
	globalvar pol_3;            pol_3=1;            // polarity of var "b".
	// +$12 - MZ
	globalvar osc_4a;           osc_4a=.5;          // Actual value. Starts at this baseline.
	globalvar osc_4b;           osc_4b=0;           // Value that "a" is increased/decreased by.
	globalvar inc_4;            inc_4=.015625;      // Amount that "b" increments by.
	globalvar lim_4;            lim_4=.984375;      // polarity is reversed when "b" reaches this value.
	globalvar pol_4;            pol_4=1;            // polarity of var "b".
	// +$16 - MZ
	globalvar osc_5a;           osc_5a=.5;          // Actual value. Starts at this baseline.
	globalvar osc_5b;           osc_5b=0;           // Value that "a" is increased/decreased by.
	globalvar inc_5;            inc_5=.03125;       // Amount that "b" increments by.
	globalvar lim_5;            lim_5=.6875;        // polarity is reversed when "b" reaches this value.
	globalvar pol_5;            pol_5=1;            // polarity of var "b".
	// +$1A - GHZ, MZ, SYZ, SLZ, SBZ
	globalvar osc_6a;           osc_6a=.5;          // Actual value. Starts at this baseline.
	globalvar osc_6b;           osc_6b=0;           // Value that "a" is increased/decreased by.
	globalvar inc_6;            inc_6=.03125;       // Amount that "b" increments by.
	globalvar lim_6;            lim_6=2;            // polarity is reversed when "b" reaches this value.
	globalvar pol_6;            pol_6=1;            // polarity of var "b".
	// +$1E - MZ, SYZ, LZ, SLZ, SBZ
	globalvar osc_7a;           osc_7a=.5;          // Actual value. Starts at this baseline.
	globalvar osc_7b;           osc_7b=0;           // Value that "a" is increased/decreased by.
	globalvar inc_7;            inc_7=.015625;      // Amount that "b" increments by.
	globalvar lim_7;            lim_7=1.40625;      // polarity is reversed when "b" reaches this value.
	globalvar pol_7;            pol_7=1;            // polarity of var "b".
	// +$22 - SLZ
	globalvar osc_8a;           osc_8a=.5;          // Actual value. Starts at this baseline.
	globalvar osc_8b;           osc_8b=0;           // Value that "a" is increased/decreased by.
	globalvar inc_8;            inc_8=0.0078125;     // Amount that "b" increments by.
	globalvar lim_8;            lim_8=1.1171875;    // polarity is reversed when "b" reaches this value.
	globalvar pol_8;            pol_8=1;            // polarity of var "b".
	// +$26 - SLZ
	globalvar osc_9a;           osc_9a=50.9375;     // Actual value. Starts at this baseline.
	globalvar osc_9b;           osc_9b=1.1171875;   // Value that "a" is increased/decreased by.
	globalvar inc_9;            inc_9=0.0078125;     // Amount that "b" increments by.
	globalvar lim_9;            lim_9=1.1171875;   // polarity is reversed when "b" reaches this value.
	globalvar pol_9;            pol_9=1;            // polarity of var "b".
	// +$2A - MZ, SYZ, LZ, SLZ
	globalvar osc_Aa;           osc_Aa=20.5;        // Actual value. Starts at this baseline.
	globalvar osc_Ab;           osc_Ab=0.703125;     // Value that "a" is increased/decreased by.
	globalvar inc_A;            inc_A=0.0078125;     // Amount that "b" increments by.
	globalvar lim_A;            lim_A=0.703125;      // polarity is reversed when "b" reaches this value.
	globalvar pol_A;            pol_A=1;            // polarity of var "b".
	// +$2E - MZ, SYZ, LZ, SLZ
	globalvar osc_Ba;           osc_Ba=30.5;        // Actual value. Starts at this baseline.
	globalvar osc_Bb;           osc_Bb=1.0546875;   // Value that "a" is increased/decreased by.
	globalvar inc_B;            inc_B=0.01171875;    // Amount that "b" increments by.
	globalvar lim_B;            lim_B=1.0546875;    // polarity is reversed when "b" reaches this value.
	globalvar pol_B;            pol_B=1;            // polarity of var "b".
	// +$32 - MZ, SYZ, LZ, SLZ
	globalvar osc_Ca;           osc_Ca=50.5;        // Actual value. Starts at this baseline.
	globalvar osc_Cb;           osc_Cb=1.7578125;   // Value that "a" is increased/decreased by.
	globalvar inc_C;            inc_C=.01953125;    // Amount that "b" increments by.
	globalvar lim_C;            lim_C=1.7578125;    // polarity is reversed when "b" reaches this value.
	globalvar pol_C;            pol_C=1;            // polarity of var "b".
	// +$36 - MZ, SYZ, LZ, SLZ
	globalvar osc_Da;           osc_Da=70.5;        // Actual value. Starts at this baseline.
	globalvar osc_Db;           osc_Db=2.4609375;   // Value that "a" is increased/decreased by.
	globalvar inc_D;            inc_D=.02734375;    // Amount that "b" increments by.
	globalvar lim_D;            lim_D=2.4609375;    // polarity is reversed when "b" reaches this value.
	globalvar pol_D;            pol_D=1;            // polarity of var "b".
	// +$3A - UNUSED
	globalvar osc_Ea;           osc_Ea=.5;          // Actual value. Starts at this baseline.
	globalvar osc_Eb;           osc_Eb=0;           // Value that "a" is increased/decreased by.
	globalvar inc_E;            inc_E=.0078125;     // Amount that "b" increments by.
	globalvar lim_E;            lim_E=.4921875;     // polarity is reversed when "b" reaches this value.
	globalvar pol_E;            pol_E=1;            // polarity of var "b".
	// +$3E - UNUSED
	globalvar osc_Fa;           osc_Fa=.5;          // Actual value. Starts at this baseline.
	globalvar osc_Fb;           osc_Fb=0;           // Value that "a" is increased/decreased by.
	globalvar inc_F;            inc_F=.0078125;     // Amount that "b" increments by.
	globalvar lim_F;            lim_F=.4921875;     // polarity is reversed when "b" reaches this value.
	globalvar pol_F;            pol_F=1;            // polarity of var "b".
}

function scr_osc_num_reset(){
	osc_0a=.5;       // +2
	osc_0b=0;
	pol_0=1;
	osc_1a=.5;       // +6
	osc_1b=0;
	pol_1=1;
	osc_2a=.5;       // +$A
	osc_2b=0;
	pol_2=1;
	osc_3a=.5;       // +$E
	osc_3b=0;
	pol_3=1;
	osc_4a=.5;       // +$12
	osc_4b=0;
	pol_4=1;
	osc_5a=.5;       // +$16
	osc_5b=0;
	pol_5=1;
	osc_6a=.5;       // +$1A
	osc_6b=0;
	pol_6=1;
	osc_7a=.5;       // +$1E
	osc_7b=0;
	pol_7=1;
	osc_8a=.5;       // +$22
	osc_8b=0;
	pol_8=1;
	osc_9a=50.9375;  // +$26
	osc_9b=1.1171875;
	pol_9=1;
	osc_Aa=20.5;     // +$2A
	osc_Ab=0.703125;
	pol_A=1;
	osc_Ba=30.5;     // +$2E
	osc_Bb=1.0546875;
	pol_B=1;
	osc_Ca=50.5;     // +$32
	osc_Cb=1.7578125;
	pol_C=1;
	osc_Da=70.5;     // +$36
	osc_Db=2.4609375;
	pol_D=1;
	osc_Ea=.5;       // +$3A
	osc_Eb=0;
	pol_E=1;
	osc_Fa=.5;       // +$3E
	osc_Fb=0;
	pol_F=1;
}

function scr_osc_num_do(){
	// Perform oscillation on values for certain objects to use. This allows some objects
	// to move in certain ways on a timer, much like how the synchronized timers work.
	// You will notice that only certain ones work in certain zones. This is to prevent
	// unnecessary actions being run during the game, and saving time for other things.

	/* $2
	if (zone==consZoneMZ || zone==consZoneLZ)
	{
	    if abs(osc_0b)==lim_0 pol_0*=-1; // First, reverse polarity when limit is reached
	    osc_0b+=inc_0*pol_0;             // Amount to increase by, multiplied by polarity
	    osc_0a+=osc_0b;                  // Added to the main osc value
	}*/

	// $6
	//if (zone==consZoneMZ || zone==consZoneSBZ)
	{
	    if abs(osc_1b)==lim_1 pol_1*=-1; // First, reverse polarity when limit is reached
	    osc_1b+=inc_1*pol_1;             // Amount to increase by, multiplied by polarity
	    osc_1a+=osc_1b;                  // Added to the main osc value
	}

	/* $A
	if (zone==consZoneMZ || zone==consZoneSYZ || zone==consZoneLZ || zone==consZoneSLZ)
	{
	    if abs(osc_2b)==lim_2 pol_2*=-1; // First, reverse polarity when limit is reached
	    osc_2b+=inc_2*pol_2;             // Amount to increase by, multiplied by polarity
	    osc_2a+=osc_2b;                  // Added to the main osc value
	}*/

	// $E    
	if abs(osc_3b)==lim_3 pol_3*=-1; // First, reverse polarity when limit is reached
	osc_3b+=inc_3*pol_3;             // Amount to increase by, multiplied by polarity
	osc_3a+=osc_3b;                  // Added to the main osc value

	/* $12 & $16
	if zone==consZoneMZ
	{
	    if abs(osc_4b)==lim_4 pol_4*=-1; // First, reverse polarity when limit is reached
	    osc_4b+=inc_4*pol_4;             // Amount to increase by, multiplied by polarity
	    osc_4a+=osc_4b;                  // Added to the main osc value

	    if abs(osc_5b)==lim_5 pol_5*=-1; // First, reverse polarity when limit is reached
	    osc_5b+=inc_5*pol_5;             // Amount to increase by, multiplied by polarity
	    osc_5a+=osc_5b;                  // Added to the main osc value
	}*/

	// $1A
	//if zone!=consZoneLZ
	{
	    if abs(osc_6b)==lim_6 pol_6*=-1; // First, reverse polarity when limit is reached
	    osc_6b+=inc_6*pol_6;             // Amount to increase by, multiplied by polarity
	    osc_6a+=osc_6b;                  // Added to the main osc value
	}

	// $1E
	//if zone!=consZoneGHZ
	{
	    if abs(osc_7b)==lim_7 pol_7*=-1; // First, reverse polarity when limit is reached
	    osc_7b+=inc_7*pol_7;             // Amount to increase by, multiplied by polarity
	    osc_7a+=osc_7b;                  // Added to the main osc value
	}

	/* $22 & $26
	if zone==consZoneSLZ
	{
	    if abs(osc_8b)==lim_8 pol_8*=-1; // First, reverse polarity when limit is reached
	    osc_8b+=inc_8*pol_8;             // Amount to increase by, multiplied by polarity
	    osc_8a+=osc_8b;                  // Added to the main osc value

	    if abs(osc_9b)==lim_9 pol_9*=-1; // First, reverse polarity when limit is reached
	    osc_9b+=inc_9*pol_9;             // Amount to increase by, multiplied by polarity
	    osc_9a+=osc_9b;                  // Added to the main osc value
	}*/

	// $2A, $2E, $32, $36 - MZ, SYZ, LZ, SLZ
	//if (zone!=consZoneGHZ || zone!=consZoneSBZ)
	{
	    if abs(osc_Ab)==lim_A pol_A*=-1; // First, reverse polarity when limit is reached
	    osc_Ab+=inc_A*pol_A;             // Amount to increase by, multiplied by polarity
	    osc_Aa+=osc_Ab;                  // Added to the main osc value

	    if abs(osc_Bb)==lim_B pol_B*=-1; // First, reverse polarity when limit is reached
	    osc_Bb+=inc_B*pol_B;             // Amount to increase by, multiplied by polarity
	    osc_Ba+=osc_Bb;                  // Added to the main osc value

	    if abs(osc_Cb)==lim_C pol_C*=-1; // First, reverse polarity when limit is reached
	    osc_Cb+=inc_C*pol_C;             // Amount to increase by, multiplied by polarity
	    osc_Ca+=osc_Cb;                  // Added to the main osc value

	    if abs(osc_Db)==lim_D pol_D*=-1; // First, reverse polarity when limit is reached
	    osc_Db+=inc_D*pol_D;             // Amount to increase by, multiplied by polarity
	    osc_Da+=osc_Db;                  // Added to the main osc value
	}

	if abs(osc_Eb)==lim_E pol_E*=-1; // First, reverse polarity when limit is reached
	osc_Eb+=inc_E*pol_E;             // Amount to increase by, multiplied by polarity
	osc_Ea+=osc_Eb;                  // Added to the main osc value

	if abs(osc_Fb)==lim_F pol_F*=-1; // First, reverse polarity when limit is reached
	osc_Fb+=inc_F*pol_F;             // Amount to increase by, multiplied by polarity
	osc_Fa+=osc_Fb;                  // Added to the main osc value
}