require 'rails_helper'

describe Company do
  it { should validate_presence_of :name }
  it { should have_many :offices }
  it { should have_and_belong_to_many :technologies }
end
