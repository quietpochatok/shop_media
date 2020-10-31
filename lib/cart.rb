class Cart

  attr_reader :catalog

  def initialize(catalog)
    @catalog = catalog
  end

  def showing_catalog
    list_goods =
    @catalog.map.with_index do |product, index|
      "#{index + 1}. #{product}"
    end
  end

  def buying_goods(user_choice_product)
    product = @catalog[user_choice_product]
    change_rest = product.rest.to_i - 1
    product.update(rest: "#{change_rest}")
    product
  end

  # def till_slip(position)
  #   hash = {}
  #   all_products_coust = 0
  #   user_choice_products = []

  #   all_products_coust += position.coust.to_i
  #   user_choice_products << position.to_s
  #   hash[user_choice_products] = all_products_coust
  #   hash
  # end
end

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
