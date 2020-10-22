
class Film < Product
  attr_accessor :director, :year

  def initialize(params)
    super

    @director = params[:director]
    @year = params[:year]
  end

  def to_s
    "Фильм #{@name}, #{@year}, реж. #{@director}, #{@coust} руб. (осталось #{@rest})"
  end

  def update(params)
    super

    @director = params[:director] if params[:director]
    @year = params[:year] if params[:year]
  end

  def self.from_file(path)
    d, a, m, i, r, = File.readlines(path, chomp: true)

    self.new(
      name: d,
      year: a,
      director: m,
      coust: i,
      rest: r
    )
  end
end
