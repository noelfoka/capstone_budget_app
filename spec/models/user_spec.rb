require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with a valid name' do
    let(:user) { User.new(name: 'John Doe', email: 'foo@bar.com', password: '123456') }

    it 'is valid' do
      expect(user).to be_valid
    end
  end

  context 'with an invalid name' do
    let(:user) { User.new(name: 'JohnDoe', email: 'foo@bar.com', password: '123456') }

    it 'is not valid' do
      expect(user).not_to be_valid
    end

    it 'has an error on the name field' do
      user.valid?
      expect(user.errors[:name]).to include('must contain two names separated by a space')
    end
  end
end
