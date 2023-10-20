class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  accepts_nested_attributes_for :foods
  has_many :recipes, dependent: :destroy
  validates :name, presence: true
end
