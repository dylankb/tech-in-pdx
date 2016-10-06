require 'rails_helper'

describe Location do
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should have_and_belong_to_many :companies}
end
