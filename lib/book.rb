class Book < Product
  attr_accessor :genre, :author

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
    name, genre, author, coust, rest = File.readlines(path, chomp: true)
    self.new(name: name, genre: genre, author: author, coust: coust,  rest: rest)
  end

  def without_rest
    "Книга '#{@name}', #{@genre}, автор — #{@author}"
  end
end
