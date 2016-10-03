class CompaniesController < ApplicationController

  before_action :authenticate_current_user, :only => :new

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        flash[:notice] = "Company successfully added!"
        format.html { redirect_to companies_path }
        format.js
      else
        format.js { render :errors}
      end
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
      respond_to do |format|
        format.html { redirect_to company_path(@company) }
        format.js
      end
    else
      respond_to :js
    end
  end

  def destroy
    @company = Company.find(params[:id])
    flash[:notice] = @company.name + " deleted!"
    @company.destroy
    redirect_to companies_path
  end

private
  def company_params
    params.require(:company).permit(:name, :description, :technologies, :street_1, :street_2, :city, :state, :zip, :twitter_handle)
  end
end
