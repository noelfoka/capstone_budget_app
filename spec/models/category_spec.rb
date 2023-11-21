require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'foo@bar.com', password: '123456') }

  it 'is valid with a name and user' do
    category = Category.new(name: 'Food', icon: '&#x1F374;', user:)
    expect(category).to be_valid
  end

  it 'is not valid without a user' do
    category = Category.new(name: 'Transportation')
    expect(category).not_to be_valid
  end

  it 'allows the same category name for different users' do
    another_user = User.create(name: 'Alice', email: 'alice@bar.com', password: '654321')
    Category.create(name: 'Food', icon: '&#x1F374;', user:)
    category2 = Category.new(name: 'Food', icon: '&#x1F374;', user: another_user)
    expect(category2).to be_valid
  end
end
