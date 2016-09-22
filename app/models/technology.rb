class Technology < ActiveRecord::Base
  has_and_belongs_to_many :technologies

  validates_presence_of :name
end
