class Event < ActiveRecord::Base
  has_many :event_tags
  has_many :tags, through: :event_tags

  validates :title, presence: true
  validates :title, uniqueness: { case_sensitive: false }
  validates :rarity, presence: true
end
