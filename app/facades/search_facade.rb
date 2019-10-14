class SearchFacade
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def members
    @members ||= PotterApiService.get_members(@house)
  end
end
