def read_coefficient(letter)
	print "#{letter} >> "
	return gets.chomp
end
def calculate_discriminant(a, b, c)
	return b**2 - 4 * a * c
end


puts "Enter the equation coefficients in the following form:"
puts "ax^2 + bx + c = 0"
a = read_coefficient("a").to_f
b = read_coefficient("b").to_f
c = read_coefficient("c").to_f
d = calculate_discriminant(a, b, c)
puts "D = #{d}"
if (d < 0)
	puts "There are no roots."
elsif (d == 0)
	x = - b / (2 * a)
	puts "x = #{x}"
else
	x1 = ( - b + Math.sqrt(d)) / (2 * a)
	x2 = ( - b - Math.sqrt(d)) / (2 * a)
	puts "x1 = #{x1}"
	puts "x2 = #{x2}"
end