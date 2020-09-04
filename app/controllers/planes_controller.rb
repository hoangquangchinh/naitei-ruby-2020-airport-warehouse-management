class PlanesController < ApplicationController
  def index
    @q = Plane.ransack params[:q]
    @planes = @q.result.page(params[:page]).per params[:limit]
  end
end
