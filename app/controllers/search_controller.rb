class SearchController < ApplicationController
  def index
    @house = params[:house]
    @members = PotterApiService.get_members(@house)

    @facade = SearchFacade.new(params[:house])
  end
end
