class Cocktail < ApplicationRecord
  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
  before_destroy
  validate :name, presence: true
end
