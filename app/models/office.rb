class Office < ActiveRecord::Base
  belongs_to :company

  validates :city, :state, :presence => true
end
