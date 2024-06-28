class Recipe < ApplicationRecord

  before_destroy :destroy_ingredients
  
  belongs_to :user
  has_many :ingredients

  validates :name, presence: true
  validates :description, presence: true

  private

  def destroy_ingredients
    self.ingredients.destroy_all
  end

end
