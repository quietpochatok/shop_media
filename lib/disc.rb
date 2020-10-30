class Disc < Product
  attr_accessor :director, :year

  def initialize(params)
    super
    @artist = params[:artist]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Фильм #{@name}, #{@year}, #{@coust} руб. (осталось #{@rest})"
  end

  def update(params)
    super

    @artist = params[:artist] if params[:artist]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
    @year = params[:year] if params[:year]
  end

  def self.from_file(path)
    d, a, b, m, i, r, = File.readlines(path, chomp: true)

    self.new(
      name: d,
      artist: m,
      genre: a,
      year: b,
      coust: i,
      rest: r
    )
  end
end
