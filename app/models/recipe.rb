class Recipe < ApplicationRecord

  belongs_to :user

  has_many :ingredients

  validates :name, presence: true
  validates :description, presence: true
  validates :source, presence: true
  validates :recipe_url, presence: true

end
