CLASS = {books: Book, films: Film, disc: Disc}

class ProductCollection

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(files_product)

    files_path = Dir["#{files_product}/*/*.txt"]

    object_products =
      files_path.map do |path|
        CLASS.map do |key, name_class|
          if path.include?(key.to_s)
            name_class.from_file(path)
          end
        end
    end

    self.new(object_products.flatten.reject{|element| element == nil})
  end

  def to_a
    @products
  end

  def sort!(**params)

    @products.sort_by!(&params[:filtr_name])

    params[:position] == :size ? @products.reverse! : @products
  end
end
