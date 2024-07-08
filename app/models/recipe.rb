class Recipe < ApplicationRecord

  mount_uploader :image, SoupImageUploader

  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :events, dependent: :destroy

  validates :name, presence: true
  validates :cooking_time, presence: true

end
