class Event < ApplicationRecord
  belongs_to :user
  belongs_to :recipe, optional: true

  has_many :attendees, dependent: :destroy

  validates :name, presence: true
  validates :start_time, presence: true
  validates :description, presence: true
end
