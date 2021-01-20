require_relative 'lib/product'
require_relative 'lib/film'
require_relative 'lib/book'
require_relative 'lib/disc'
require_relative 'lib/product_collection'
require_relative 'lib/cart'

product_collections = ProductCollection.from_dir("#{__dir__}/data")

sort_product_collections = product_collections.sort!(filtr_name: :rest, position: :size)

user_cart = Cart.new(sort_product_collections)

start_shop = 0
all_products_coust = 0
user_choice_products = []

while start_shop == 0
  puts "\nЧто хотите купить:\n\n"
  puts user_cart.showing_catalog
  puts '0.Выход'
  user_choice = STDIN.gets.to_i - 1
  break if user_choice == -1
  user_product = user_cart.buying_goods(user_choice)

  next puts "Извините, но этот товар закончился :( выберите нечто другое пожалуйста!" if user_product == nil

  all_products_coust += user_product.coust.to_i
  user_choice_products << user_product

  puts <<~END
    \nВы выбрали: #{user_product.to_s}\n
    Всего товаров на сумму: #{all_products_coust} руб.
  END
end

puts "\nВы купили:\n\n"

total_list_order =
  user_cart.order_sheet(user_choice_products).map do |class_object, count_goods|
    "#{class_object.without_rest} - #{class_object.coust} рублей х #{count_goods} шт = #{class_object.coust.to_i * count_goods}"
end

puts total_list_order

puts "\nС Вас — #{all_products_coust} руб. Спасибо за покупки!"
