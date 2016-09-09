class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "List successfully added!"
    else
      render :new
    end
  end

  def company_params
    params.require(:company).permit(:name, :description, :technologies, :street_1, :street_2, :city, :state, :zip)
  end
end
