require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'
# product = Film.new(990, 1)
# puts "Фильм Леон стоит #{product.coust} рублей, остаток: #{product.rest}"
products = []

products << Film.new(
  name: "Леон", year: 1990, director: 'Люк Бессон', coust: 990,  rest: 1
)

products << Film.new(
  name: 'Дурак', year: '2014', director: 'Юрий Быков', coust: 390, rest: 1
)

products << Book.new(
  name: 'Идиот',
  genre: 'роман',
  author: 'Федор Достоевский',
  coust: 1500,
  rest: 10
)

products.each(&method(:puts))


