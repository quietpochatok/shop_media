require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'
require_relative 'lib/product_collection'
# product = Film.new(990, 1)
# puts "Фильм Леон стоит #{product.coust} рублей, остаток: #{product.rest}"
# products = []

# products << Film.new(
#   name: "Леон", year: 1990, director: 'Люк Бессон', coust: 990,  rest: 1
# )

# products << Film.new(
#   name: 'Дурак', year: '2014', director: 'Юрий Быков', coust: 390, rest: 1
# )

# products << Book.new(
#   name: 'Идиот',
#   genre: 'роман',
#   author: 'Федор Достоевский',
#   coust: 1500,
#   rest: 10
# )

# # Выводим все продукты в консоль просто передавая их методу puts
# puts 'Вот какие товары у нас есть:'
# puts
# products.each(&method(:puts))

film = Film.new(name: 'Леон', director: 'Люк Бессон', coust: 990)
film.year = 1994
film.update(rest: 15)

book = Book.new(name: 'Идиот', genre: 'роман', rest: 10)
book.author = 'Федька Достоевский'
book.update(author: 'Фёдор Достоевский', coust: 1500)

# Выведем результат на экран
puts film
puts book
puts

film1 = Film.from_file('./data/films/01.txt')
book1 = Book.from_file('./data/books/01.txt')
puts film1
puts book1

begin
  Product.from_file('./data/films/*.txt')
rescue NotImplementedError
  puts 'Метод класса Product.from_file не реализован'
end

puts "Return method from_dir:"
p collection = ProductCollection.from_dir(__dir__ + '/data')
# puts
# p collection.products

puts "Working collection.sort"
p collection.sort!(filtr_name: :rest, position: :size)

puts
# collection.to_a.each_with_index(&method(:puts))
# collection.to_a.each_with_index do |product, index|
#   puts "#{index + 1} #{product}"
# end

# user_choice = gets.to_i

p r = collection.to_a[0].rest.to_i - 1
p collection.to_a[0].update(rest: "#{r}")
p collection.to_a[0].rest.to_i


# puts "Return method to_a:"
# p collection.to_a
