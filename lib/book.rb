class Book < Product
  # Книга «Идиот», роман, автор — Федор Достоевский, 1500 руб. (осталось 10)
  # Объявим методы-геттеры для переменных экземпляра класса Книга:
  # @genre — жанр (проза, роман, повесть…)
  # @author — фамилия и имя автора
  attr_reader :genre, :author

  # В конструкторе класса Book вызовем конструктор класса-родителя Product,
  # он заполнит переменные экземпляра @price и @amount, а остальные поля,
  # специфичные только для книги, заполним мы самостоятельно.
  def initialize(params)
    super

    @author = params[:author]
    @genre = params[:genre]
  end

  def to_s
    "Книга '#{@name}' #{@genre}, автор — #{@author} #{super}"
  end

end
