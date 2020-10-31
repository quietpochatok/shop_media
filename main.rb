require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'
require_relative 'lib/disc'
require_relative 'lib/product_collection'
require_relative 'lib/cart'
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

# film = Film.new(name: 'Леон', director: 'Люк Бессон', coust: 990)
# film.year = 1994
# film.update(rest: 15)

# book = Book.new(name: 'Идиот', genre: 'роман', rest: 10)
# book.author = 'Федька Достоевский'
# book.update(author: 'Фёдор Достоевский', coust: 1500)

# # Выведем результат на экран
# puts film
# puts book
# puts

# film1 = Film.from_file('./data/films/01.txt')
# book1 = Book.from_file('./data/books/01.txt')
# puts film1
# puts book1

# begin
#   Product.from_file('./data/films/*.txt')
# rescue NotImplementedError
#   puts 'Метод класса Product.from_file не реализован'
# end

puts "Return method from_dir:"
product_collections = ProductCollection.from_dir(__dir__ + '/data')

puts "Working collection.sort"
sort_product_collections = product_collections.sort!(filtr_name: :rest, position: :size)

puts "Working cart class"
user_card = Cart.new(sort_product_collections)

start_shop = 0
all_products_coust = 0
user_choice_products = []

while start_shop == 0
  puts "\nЧто хотите купить:\n"
  puts user_card.showing_catalog
  user_choice = STDIN.gets.to_i - 1
  break if user_choice == -1
  user_product = user_card.buying_goods(user_choice)
  all_products_coust += user_product.coust.to_i
  user_choice_products << user_product
  puts <<~END
    \nВы выбрали: #{user_product}\n
    Всего товаров на сумму: #{all_products_coust} руб.
  END
end
puts "\nВы купили:\n\n"
puts user_choice_products.each(&:to_s)
puts "\nС Вас — #{all_products_coust} руб. Спасибо за покупки!"



# user = 0
# all_products_coust = 0
# user_choice_products = []
# while user >= 0
# puts 'Что хотите купить:'
#   collection.to_a.each_with_index do |product, index|
#     puts "#{index + 1}. #{product}"
#   end
# user_choice = STDIN.gets.to_i - 1
# break if user_choice == -1

# r = collection.to_a[user_choice].rest.to_i - 1
# collection.to_a[user_choice].update(rest: "#{r}")
# collection.to_a[user_choice].rest.to_i
# puts "Вы выбрали: #{collection.to_a[user_choice]}"
# all_products_coust += collection.to_a[user_choice].coust.to_i
# user_choice_products << collection.to_a[user_choice].to_s
# puts "Всего товаров на сумму: #{all_products_coust} руб."
# end

# puts <<~END
# Всего товаров на сумму: #{all_products_coust} руб.
# END
# puts user_choice_products.each(&:to_s)

