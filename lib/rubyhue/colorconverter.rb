module ColorConverter

	#Converts a color in the 0-255 RGB range to 
	#an XY coordinate in the CIE1931 color plane
	def rgb_to_xy(r,g,b)
		r = xy_color(r)
		g = xy_color(g)
		b = xy_color(b)

		X = r * 0.4124 + g * 0.3576 + b * 0.1805
		Y = r * 0.2126 + g * 0.7152 + b * 0.0722
		Z = r * 0.0193 + g * 0.1192 + b * 0.9505

		return{
			x: X/(X+Y+Z),
			y: Y/(X+Y+Z)
		}
	end

	private

		#redefines the 0-255 RGB values for CIE1931 spec
		def xy_color(color)
			if (color/255 > 0.04045)
				return (((color/255)/1.055)**2.4) * 100)
			else
				return ((color/255)/12.92 * 100)
			end
		end

end