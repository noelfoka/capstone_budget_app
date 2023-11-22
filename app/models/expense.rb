class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
