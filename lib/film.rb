
class Film < Product
  attr_accessor :director, :year

  def initialize(params)
    super

    @director = params[:director]
    @year = params[:year]
  end

  def to_s
    "Фильм #{@name}, #{@year}, реж. #{@director}, #{super}"
  end

  def update(params)
    super

    @director = params[:director] if params[:director]
    @year = params[:year] if params[:year]
  end

  def self.from_file(path)
    name, year, director, coust, rest, = File.readlines(path, chomp: true)

    self.new(
      name: name,
      year: year,
      director: director,
      coust: coust,
      rest: rest
    )
  end

  def without_rest
    "Фильм #{@name}, #{@year}, реж. #{@director}"
  end
end
