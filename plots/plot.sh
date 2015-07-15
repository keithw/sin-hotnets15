#\bin\bash
gnuplot gnuplot_delay_over_srtf && display delay_over_srtf.svg
gnuplot gnuplot_percent_match_srtf && display percent_match_srtf.svg
inkscape delay_over_srtf.svg -A delay_over_srtf.pdf
inkscape percent_match_srtf.svg -A percent_match_srtf.pdf
