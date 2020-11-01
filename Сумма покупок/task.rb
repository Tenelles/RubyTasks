def addProduct(hash, title)
  print "Введите цену за штуку товара: "
	price = gets.chomp.to_f
  print "Введите количество купленного товара: "
  amount = gets.chomp.to_f
  hash[title] = {price => amount}
  print "\n"
end

def print_hash(hash)
  hash.each do |title, info|
    info.each do |price, amount|
      puts title
      puts "Цена: " + price.to_s + " Р/шт"
      puts "Куплено: " + amount.to_s + " шт"
      puts "Потрачено: " + (price*amount).to_s + " Р"
      print "\n"
    end
  end
end

def count_sum(hash)
  sum = 0
  hash.each do |title, info|
    info.each { |price, amount| sum += (price * amount) }
  end
  return sum
end

goods = Hash.new

title = "Имя"
is_reading = true
while is_reading do
  puts "Введите название товара. Чтобы остановиться, введите \"Стоп\""
  title = gets.chomp
  if title == 'Стоп'
    is_reading = false
    print "\n"
  else
    addProduct(goods, title)
  end
end


print_hash(goods)
puts "Всего потрачено: " + count_sum(goods).to_s