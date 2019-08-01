class Ingredient < ApplicationRecord
  has_many :doses
  before_destroy :check_for_cocktails, through: :doses
  validate :name, presence: true

  private

  def check_for_cocktails
    if cocktails.count > 0
      errors.add_to_base("cannot delete ingredient while cocktails exist")
      return false
  end
end
