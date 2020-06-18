class Recipe < ApplicationRecord
  belongs_to :user 
  has_one_attached :image
  
  validates :title, presence: true 
  validates :description, presence: true 
  validates :user, presence: true 
  
  def to_s 
    title
  end 
end
