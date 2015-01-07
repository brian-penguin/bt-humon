class Event < ActiveRecord::Base
  validates_presence_of :lat
  validates_presence_of :lon
  validates_presence_of :name
  validates_presence_of :started_at

  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'
end
