#\bin\bash
gnuplot gnuplot_delay_over_srtf #&& display delay_over_srtf.svg
gnuplot gnuplot_num_roundtrips #&& display num_roundtrips.svg
inkscape delay_over_srtf.svg -A delay_over_srtf.pdf
inkscape num_roundtrips.svg -A num_roundtrips.pdf
