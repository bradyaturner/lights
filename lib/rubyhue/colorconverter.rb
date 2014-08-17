module ColorConverter

	#Converts a color in the 0-255 RGB range to 
	#an XY coordinate in the CIE1931 color plane
	def rgb_to_xy(r,g,b)
		x = r * 0.4124 + g * 0.3576 + b * 0.1805
		y = r * 0.2126 + g * 0.7152 + b * 0.0722
		z = r * 0.0193 + g * 0.1192 + b * 0.9505

		return{
			x => x/(x+y+z),
			y => y/(z+y+z)
		}
	end

end