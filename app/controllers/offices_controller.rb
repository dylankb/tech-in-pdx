class OfficesController < ApplicationController
  before_action :set_company

  def new
    @office = Office.new
    @options = ["HQ", "Branch"]
  end

  def create
    @options = ["HQ", "Branch"]
    @office = @company.offices.new(office_params)
    if @office.save
      flash[:notice] = "New office saved!"
      redirect_to company_path(@company)
    else
      render :new
    end

  end

private
  def office_params
    params.require(:office).permit(:office_type, :street_1, :street_2, :city, :state, :zip)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

end
