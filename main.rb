require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'
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
film.update(rest: 5)

book = Book.new(name: 'Идиот', genre: 'роман', rest: 10)
book.author = 'Федька Достоевский'
book.update(author: 'Фёдор Достоевский', coust: 1500)

# Выведем результат на экран
puts film
puts book
