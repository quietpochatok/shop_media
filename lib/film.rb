#  «Леон», 1994, . Люк Бессон, 990 руб. (осталось 5)
# Фильм «Дурак», 2014, реж. Юрий Быков, 390 руб. (осталось 1)
# Книга «Идиот», роман, автор — Федор Достоевский, 1500 руб. (осталось 10)
class Film < Product
  attr_reader :director, :year

  def initialize(params)
    super
    @director = params[:director]
    @year = params[:year]
  end

  def to_s
    "Фильм #{@name}, #{@year}, реж. #{@director}, #{@coust} руб. (осталось #{@rest})"
  end
end
