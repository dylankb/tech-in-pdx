class Office < ActiveRecord::Base
  belongs_to :company

  validates :street_1, :presence => true
end
