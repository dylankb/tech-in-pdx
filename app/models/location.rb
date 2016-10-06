class Location < ActiveRecord::Base
  has_and_belongs_to_many :companies

  validates_presence_of :city, :state
end
