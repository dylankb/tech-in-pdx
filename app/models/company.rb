class Company < ActiveRecord::Base
  validates :name, :presence => true
  validates :technologies, :presence => true
end
