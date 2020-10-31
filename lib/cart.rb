class Cart
  attr_reader :catalog

  def initialize(catalog)
    @catalog = catalog
  end

  def showing_catalog
    list_goods =
      @catalog.map.with_index {|product, index| "#{index + 1}. #{product}"}
  end

  def buying_goods(user_choice_product)
    product = @catalog[user_choice_product]
    change_rest = product.rest.to_i - 1
    product.update(rest: "#{change_rest}")
    product
  end
end
