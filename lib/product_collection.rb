# Продолжаем развивать наш «Магазин»: реализуйте класс ProductCollection,
# который может хранить в себе любые товары (фильмы или книги) и у которого есть:

# Метод класса (статический метод) from_dir, который считывает продукты из папки data, сам понимая,
# какие товары в какой папке лежат.

# Метод экземпляра to_a, который возвращает массив товаров.

# Метод экземпляра sort, который сортирует товары по цене,
# остатку на складе или по названию (как по возрастанию, так и по убыванию):

# Создайте в основной программе коллекцию товаров, прочитав её из директории и выведите все товары на экран
class ProductCollection
  # attr_accessor :products

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(files_product)

    files_path = Dir["#{files_product}/*/*.txt"]

    object_products =

      files_path.map do |path|
        path.include?('films') ? Film.from_file(path) : Book.from_file(path)
      end

    self.new(object_products)
  end

  def to_a
    @products
  end

  def sort!(params)

    if params[:filtr_name] == :name
      @products.sort_by! { |word| word.name }
    elsif params[:filtr_name] == :rest
      @products.sort_by!(&params[:filtr_name])
    elsif params[:filtr_name] == :coust
      @products.sort_by! { |word| word.coust }
    end

    if params[:position] == :size
      @products.reverse!
    else
      @products
    end
  end
end
