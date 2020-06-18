class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes 

  def recipe_options
    recipes.map do |recipe|
      [recipe.title, recipe.id]
    end 
  end 
end
