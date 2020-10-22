class Book < Product
  # Книга «Идиот», роман, автор — Федор Достоевский, 1500 руб. (осталось 10)
  # Объявим методы-геттеры для переменных экземпляра класса Книга:
  # @genre — жанр (проза, роман, повесть…)
  # @author — фамилия и имя автора
  attr_accessor :genre, :author

  # В конструкторе класса Book вызовем конструктор класса-родителя Product,
  # он заполнит переменные экземпляра @price и @amount, а остальные поля,
  # специфичные только для книги, заполним мы самостоятельно.
  def initialize(params)
    super

    @author = params[:author]
    @genre = params[:genre]
  end

  def to_s
    "Книга '#{@name}', #{@genre}, автор — #{@author} #{super}"
  end

  def update(params)
    super

    @author = params[:author] if params[:author]
    @genre = params[:genre] if params[:genre]
  end

  def self.from_file(path)
    d, a, m, i, r, = File.readlines(path, chomp: true)
    self.new(name: d, genre: a, author: m, coust: i,  rest: r)
  end
end
