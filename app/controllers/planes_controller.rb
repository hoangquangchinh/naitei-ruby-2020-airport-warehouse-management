class PlanesController < ApplicationController
  def index
    @q = Plane.ransack params[:q]
    @planes = @q.result.page(params[:page]).per params[:limit]
  end

  def new
    @plane = Plane.new
    @plane.flights.new
  end

  def create
    @plane = Plane.new plane_params
    if @plane.save
      redirect_to planes_path
      flash[:success] = t "planes.index.add_success"
    else
      flash[:error] = t "planes.index.add_fail"
      render "new"
    end
  end

  def show
    find_plane
    @q = @plane.requests.ransack params[:q]
    @plane_requests = @q.result.order(id: :desc).page(params[:page]).per Settings.pagination.user_page
  end

  private

  def find_plane
    @plane = Plane.find_by id: params.require(:id)
    @page = params[:page].nil? ? Settings.pagination.default_page : params[:page].to_i
  end

  def plane_params
    params.require(:plane).permit :code, flights_attributes: [:title, :from, :to, :status]
  end
end
