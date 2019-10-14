class SearchController < ApplicationController
  def index
    @house = params[:house]
  end
end
