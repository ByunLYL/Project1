class StaticPagesController < ApplicationController
  def home
    if params[:query].present?
      # 使用 LOWER 以便在 SQLite 中实现不区分大小写的搜索
      @cities = City.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%").paginate(page: params[:page], per_page: 10)
    else
      @cities = City.paginate(page: params[:page], per_page: 10)
    end

    @health_data = HealthData.paginate(page: params[:page], per_page: 10)
  end
end
