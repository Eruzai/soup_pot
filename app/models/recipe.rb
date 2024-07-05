class Recipe < ApplicationRecord

  mount_uploader :image, SoupImageUploader

  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :directions, presence: true
  validates :cooking_time, presence: true

end
