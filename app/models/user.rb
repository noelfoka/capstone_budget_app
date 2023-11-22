class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories
  has_many :expenses

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validate :fullname

  def fullname
    return unless name.split.size != 2

    errors.add(:name, 'must contain two names separated by a space')
  end
end
