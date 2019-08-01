class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validate :description, :cocktail, :ingredient, presence: true
  validates_uniqueness_of :dose_description, :scope => [:cocktail, :ingredient]
end

