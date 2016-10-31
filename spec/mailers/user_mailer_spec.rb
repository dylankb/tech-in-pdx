require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

  before(:each) do
    @attr = {
      :email => 'foobar@foo.com',
      :password => 'password',
      :password_confirmation => 'password'
    }
    ActionMailer::Base.deliveries = []
  end

  user = FactoryGirl.create(:user)
  mail = UserMailer.registration_confirmation(user).deliver

  it 'renders the subject' do
    expect(mail.subject).to eq('Registration Confirmation')
  end

  it 'sends an email' do
    expect { UserMailer.registration_confirmation(user).deliver }
    .to change { ActionMailer::Base.deliveries.count }.by(1)
  end

end
