class SearchController < ApplicationController
  def index
    @facade = SearchFacade.new(params[:house])
  end
end
