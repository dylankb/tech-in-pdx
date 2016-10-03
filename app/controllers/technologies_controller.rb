class TechnologiesController < ApplicationController
  before_action :set_company, only: [:new, :create]

  def new
    @technology = Technology.new
  end

  def create
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

private
  def technology_params
    params.require(:technology).permit(:name, :description)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
