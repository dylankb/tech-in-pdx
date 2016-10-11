class CompaniesController < ApplicationController

  before_action :authenticate_current_user, :only => [:new, :create, :edit, :update]
  before_action :authenticate_admin, :only => :delete

  def new
    @company = Company.new
    @technologies = Technology.all
    @locations = Location.all
  end

  def create
    @technologies = Technology.all
    @company = Company.new(company_params)
    if params[:company][:technology_ids]
      params[:company][:technology_ids].each do |id|
        technology = Technology.find(id)
        @company.technologies.push(technology)
      end
    end
    if params[:company][:location_ids]
      params[:company][:location_ids].each do |id|
        location = Location.find(id)
        @company.locations.push(location)
      end
    end
    respond_to do |format|
      if @company.save
        flash.now[:notice] = "#{@company.name} successfully added!"
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
    if params[:company][:technology_ids]
      params[:company][:technology_ids].each do |id|
        technology = Technology.find(id)
        unless @company.technologies.include?(technology)
          @company.technologies.push(technology)
        end
      end
    end
    if params[:company][:location_ids]
      params[:company][:location_ids].each do |id|
        location = Location.find(id)
        unless @company.locations.include?(location)
          @company.locations.push(location)
        end
      end
    end
    respond_to do |format|
      if @company.update(company_params)
        flash.now[:notice] = @company.name + " updated!"
        format.html { redirect_to company_path(@company) }
        format.js
      else
        format.js { render :errors }
      end
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
    params.require(:company).permit(:name, :description, :twitter_handle, :technology_ids, :location_ids )
  end
end
