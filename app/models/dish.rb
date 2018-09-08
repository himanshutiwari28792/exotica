class Dish < ApplicationRecord
  # Associations
  belongs_to :course

  # Validations
  validates :name, presence: true
  validates :price, presence: true
end
