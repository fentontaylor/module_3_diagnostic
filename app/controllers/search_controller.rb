class SearchController < ApplicationController
  def index
    @house = params[:house]
    @members = get_members(@house)
  end

  private

  def get_members(house)
    conn = Faraday.new('https://www.potterapi.com/v1/')
    response = conn.get do |req|
      req.url 'characters'
      req.params['key'] = ENV['API_KEY']
      req.params['house'] = house
      req.params['orderOfThePhoenix'] = true
    end

    json = JSON.parse(response.body)

    json.map {|char| Character.new(char)}
  end
end
