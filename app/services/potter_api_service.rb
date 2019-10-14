class PotterApiService
  def self.get_members(house)
    PotterApiService.new.get_members(house)
  end

  def get_members(house)
    response = phoenix_members(house)
    json = JSON.parse(response.body)
    json.map {|char| Character.new(char)}
  end

  private

  def conn
    Faraday.new('https://www.potterapi.com/v1/')
  end

  def phoenix_members(house)
    conn.get do |req|
      req.url 'characters'
      req.params['key'] = ENV['API_KEY']
      req.params['orderOfThePhoenix'] = true
      req.params['house'] = house
    end
  end
end
