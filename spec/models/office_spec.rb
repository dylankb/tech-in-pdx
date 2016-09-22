require 'rails_helper'

describe Office do
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should belong_to :company }
end
