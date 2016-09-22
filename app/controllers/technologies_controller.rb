class TechnologiesController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @technology = Technology.new
  end

  def create
    @company = Company.find(params[:company_id])
    @technology = @company.technologies.new(technology_params)
    if @technology.save
      flash[:notice] = "New technology saved"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def technology_params
    params.require(:technology).permit(:name, :description)
  end
end
