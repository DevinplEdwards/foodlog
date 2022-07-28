class Entry < ApplicationRecord
  validates :calories, :protein, :carbs, :fats, :meal_type, presence: true
  validates :calories, :protein, :carbs, :fats, numericality: { only_integer: true }

  def day
    self.created_at.strftime("%b %e,%Y")
  end
end
