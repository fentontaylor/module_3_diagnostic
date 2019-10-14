class SearchFacade
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def members
    characters = service.get_members(@house)
    characters.map {|char| Character.new(char)}
  end

  private

  def service
    @service ||= PotterApiService.new
  end
end
