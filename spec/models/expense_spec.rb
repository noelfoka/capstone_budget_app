require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'foo@bar.com', password: '123456') }
  let(:category) { Category.create(name: 'Food', icon: '&#x1F374;', user:) }

  it 'is associated with a category' do
    expense = Expense.new(amount: 25, category:)
    expect(expense.category).to eq(category)
  end

  it 'is associated with an author (User)' do
    expense = Expense.new(amount: 30.00, category:, author: user)
    expect(expense.author).to eq(user)
  end

  it 'requires a category' do
    expense = Expense.new(amount: 25, author: user)
    expect(expense).to_not be_valid
  end

  it 'requires an author (User)' do
    expense = Expense.new(amount: 30.00, category:)
    expect(expense).to_not be_valid
  end

  it 'can save a valid expense' do
    expense = Expense.new(name: 'Pizza', amount: 25, category:, author: user)
    expect(expense).to be_valid
  end
end
