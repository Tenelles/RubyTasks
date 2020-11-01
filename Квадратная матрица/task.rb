def get_string(input)
  numbers = []
  until input.size == 0
    s_numbers = input.split(',')
    s_numbers.each { |number| numbers << number.to_i }
    input = gets.chomp
  end
  return numbers
end

def is_matrix_square(matrix)
  size = matrix[0].size
  return false unless matrix.size == size

  matrix.each { |m_string| return false unless m_string.size == size }
  return true
end

def copy_matrix(matrix)
  copy = []
  matrix.each do |m_string|
    string_copy = []
    m_string.each do |m_cell|
      string_copy << m_cell
    end
    copy << string_copy
  end
  return copy
end
def get_minor(matrix, nstring, ncolumn)
  new_matrix = copy_matrix(matrix)
  new_matrix.delete_at(nstring)
  new_matrix.each { |m_string| m_string.delete_at(ncolumn) }
  return new_matrix
end

def get_determinator(matrix)
  size = matrix.size
  return matrix[0][0] if size == 1
  return (matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix [1][0]) if size == 2
  determinator = 0
  (0...size).each do |i| 
    minor_determinator = get_determinator(get_minor(matrix, 0, i))
    determinator += ((-1)**i)*matrix[0][i] * minor_determinator
  end
  return determinator
end

def factorial(n)
  return 1 if n == 1
  return n * factorial(n - 1)

end

puts 'Введите матрицу, состоящую из цифр'
puts 'Цифры разделяйте запятыми'
puts 'Пустая строка - окончание ввода одной строки'
puts 'Вторая подряд пустая строка - окончание ввода матрицы'
input = ','
matrix = []
until input.size == 0
  matrix << get_string(input)
  input = gets.chomp
end

puts "Полученная матрица:"

matrix.each do |m_string|
  m_string.each do |m_cell|
    print m_cell.to_s + " "
  end
  puts
end

if is_matrix_square(matrix)
  puts "Матрица квадратная, ее определитель: #{get_determinator(matrix)}"
else 
  puts "Матрица не является квадратной"
end