class Company < ActiveRecord::Base
  has_and_belongs_to_many :technologies
  has_many :offices

  validates :name, :presence => true
end
