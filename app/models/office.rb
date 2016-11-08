class Office < ApplicationRecord
  belongs_to :company
  belongs_to :location

  accepts_nested_attributes_for :location
end
