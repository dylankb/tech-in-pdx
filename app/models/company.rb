class Company < ActiveRecord::Base
  has_many :offices

  validates :name, :presence => true
end
