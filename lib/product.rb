class Product
  attr_accessor :name, :coust, :rest
  # def initialize(coust, rest)
  #   @coust = coust
  #   @rest = rest
  # end
  def initialize(params)
    @name = params[:name]
    @coust = params[:coust]
    @rest = params[:rest]
  end

  def to_s
    "#{@coust} руб. (осталось #{@rest})"
  end

  def update(params)
    @name = params[:name] if params[:name]
    @coust = params[:coust] if params[:coust]
    @rest = params[:rest] if params[:rest]
  end
end
