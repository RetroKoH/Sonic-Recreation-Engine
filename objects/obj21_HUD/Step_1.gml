/// @description Increment timer
// Normally this object doesn't handle this, but I'm going to put the timer logic here.

if (f_timecount)
{
	p_time++;
	p_timecenti = 100*(p_time/60);

	if (p_time >= 60)
	{
		p_time = 0;
		p_timeseconds++;
		p_timecenti = p_timecenti mod 100;
		if (p_timeseconds >= 60)
		{
			p_timeseconds = 0;
			p_timeminutes++;
		}
	}
}

if (framecount%8 == 0) blink^=true;
