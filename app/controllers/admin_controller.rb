class AdminController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:notice] = @company.name + " updated!"
      respond_to do |format|
        format.html { redirect_to admin_path(@company) }
        format.js
      end
    else
      render :edit
    end
  end
end
