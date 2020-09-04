class LocationsController < ApplicationController
  def index
    @locations = Location.page(params[:page]).per Settings.pagination.locations_page
    @radars = Location.get_ready
    @readys = Location.get_gara
    @q = Location.ransack params[:q]
    @locations = @q.result.page(params[:page]).per Settings.pagination.user_page
  end
end
