class Player

  attr_accessor :token, :name

  def initialize(token, name)
    @token = token
    @name = name
  end

  def get_coord
    gets.chomp.to_i
  end
end
