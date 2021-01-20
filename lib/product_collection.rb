class ProductCollection
  CLASS = {books: Book, films: Film, disc: Disc}

  def self.from_dir(files_product)
    files_path = Dir["#{files_product}/*/*.txt"]

    object_products =
      files_path.map do |path|
        CLASS.map do |type_product, name_class|
          name_class.from_file(path) if path.include?(type_product.to_s)
        end
    end

    self.new(object_products.flatten.reject{ |element| element == nil })
  end

  def initialize(products = [])
    @products = products
  end

  def to_a
    @products
  end

  def sort!(**params)
    type_products = CLASS.values.to_s.downcase

    params.include?(%I[#{type_products}]) ? @products.sort_by!(&params[:filtr_name]) : @products
    params[:position] == :size ? @products.reverse! : @products
  end
end
