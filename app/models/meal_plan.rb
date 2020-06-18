class MealPlan < ApplicationRecord
  validates :start_date, presence: true 
  validates :end_date, presence: true 
  validates :user, presence: true 
  accepts_nested_attributes_for :meals 
  has_many :meals, -> { order(:date) }, inverse_of: :meal_plan, dependent: :destroy
  


  def build_meals
    user_recipe_ids = user.recipes.pluck(:id)

    (start_date..end_date).each do |date|
      unused_recipes = user_recipe_ids - meals.map(&:recipe_id)

      available_recipe_ids = user_recipe_ids - meals.map(&:recipe_id)
      meals.build(date: date, recipe_id: available_recipe_ids.sample)
  end 

  def to_s 
    "#{start_date} - #{end_date}"
  end 

end
