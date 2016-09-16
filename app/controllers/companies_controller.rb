class CompaniesController < ApplicationController

  before_action :authenticate_current_user, :only => :new

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "List successfully added!"
      redirect_to companies_path
    else
      render :new
    end
  end

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:notice] = @company.name + " updated!"
      redirect_to companies_path
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])
    flash[:notice] = @company.name + " deleted!"
    @company.destroy
    redirect_to companies_path
  end

  def company_params
    params.require(:company).permit(:name, :description, :technologies, :street_1, :street_2, :city, :state, :zip)
  end
end
