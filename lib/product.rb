class Product
  attr_reader :name, :coust, :rest
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

  end
end
