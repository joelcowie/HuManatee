require_relative '../rails_helper'
describe User do

  let(:user) { User.create(first_name: "JJ", last_name: "JJ", email: "j@flatiron.com", password:"joel", password_confirmation:"joel") }
  let(:no_email) { User.create(first_name: "JJ", last_name: "JJ", email: "jj.com", password:"joel", password_confirmation:"joel") }
  let(:no_first_name) { User.create(first_name: "", last_name: "JJ", email: "jj@flatiron.com", password:"joel", password_confirmation:"joel") }
  let(:no_last_name) { User.create(first_name: "JJ", last_name: "", email: "jj@flatiron.com", password:"joel", password_confirmation:"joel") }

  context 'validations' do

    it 'is valid with an email, first name, last name, and passwords' do
      expect(user).to be_valid
    end

    it 'is invalid without a valid email' do
      expect(no_email).to_not be_valid
    end

    it 'is invalid without a first name' do
      expect(no_first_name).to_not be_valid
    end

    it 'is invalid without a last name' do
      expect(no_last_name).to_not be_valid
    end

    it 'is invalid without a last name' do
      expect(no_last_name).to_not be_valid
    end
  end

  context 'instance methods' do

    it 'should print out the full name' do
      expect(user.full_name).to eq("JJ JJ")
    end
  end
end
