class Disc < Product
  attr_accessor :director, :year

  def initialize(params)
    super
    @artist = params[:artist]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Альбом #{@artist} - #{@name}, #{@genre}, #{@year}, #{super}"
  end

  def update(params)
    super

    @artist = params[:artist] if params[:artist]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end

  def self.from_file(path)
    name, artist, genre, year, coust, rest, = File.readlines(path, chomp: true)

    self.new(
      name: name,
      artist: artist,
      genre: genre,
      year: year,
      coust: coust,
      rest: rest
    )
  end
end

