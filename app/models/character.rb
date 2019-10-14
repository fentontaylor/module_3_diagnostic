class Character
  attr_reader :name, :house, :role, :patronus

  def initialize(hash)
    @name = hash['name']
    @house = hash['house']
    @role = hash['role'] || 'none'
    @patronus = hash['patronus'] || 'unknown'
  end
end
