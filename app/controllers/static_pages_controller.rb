class StaticPagesController < ApplicationController
  def home
    # Add Pagination to Collection Navigation
    if params[:query].present?
      @cities = City.where("name ILIKE ?", "%#{params[:query]}%").page(params[:page]).per(10)
  else
    @cities = City.paginate(page: params[:page], per_page: 10)
  end
    @health_data = HealthData.page(params[:page]).per(10)


  end
end

