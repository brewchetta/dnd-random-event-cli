class Event < ActiveRecord::Base
  has_many :event_tags
  has_many :tags, through: :event_tags

  validates :title, uniqueness: true
  validates :title, presence: true
  validates :rarity, presence: true
end
