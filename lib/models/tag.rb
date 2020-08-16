class Tag < ActiveRecord::Base
  has_many :event_tags
  has_many :events, through: :event_tags

  def self.all_names
    self.all.map(&:name)
  end
end
