class Company < ActiveRecord::Base
  has_and_belongs_to_many :companies
  has_many :offices

  validates :name, :presence => true
end
