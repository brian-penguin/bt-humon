class Event < ActiveRecord::Base
  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'

  validates_presence_of :lat
  validates_presence_of :lon
  validates_presence_of :name
  validates_presence_of :started_at

  reverse_geocoded_by :lat, :lon
end
