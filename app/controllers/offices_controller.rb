class OfficesController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @office = Office.new
    @options = ["HQ", "Branch"]
  end

  def create
    @company = Company.find(params[:company_id])
    @office = @company.offices.new(office_params)
    if @office.save
      flash[:notice] = "New office saved!"
      redirect_to company_path(@company)
    else
      render :new
    end

  end

  def office_params
    params.require(:office).permit(:office_type, :street_1, :street_2, :city, :state, :zip)
  end

end
