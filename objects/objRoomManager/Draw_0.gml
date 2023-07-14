/// @description Draw the order of the levels

for(var i = 0; i < array_length(levels); ++i) {
	draw_text(100 + (i * 64), 64, levels[i][0]);
}

