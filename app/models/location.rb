class Location < ActiveRecord::Base
  has_many :offices
  has_many :companies, through: :offices

  validates_presence_of :city, :state

  accepts_nested_attributes_for :companies
end
