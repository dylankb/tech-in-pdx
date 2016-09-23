class TechnologiesController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @technology = Technology.new
  end

  def create
    @company = Company.find(params[:company_id])
    @technology = Technology.new(technology_params)
    if @technology.save
      flash[:notice] = "New technology saved!"
      @company.technologies.push(@technology)
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def index
    @technologies = Technology.all
  end

  def show
    @technology = Technology.find(params[:id])
  end

  def technology_params
    params.require(:technology).permit(:name, :description)
  end
end
