class User < ActiveRecord::Base
  validates_uniqueness_of :device_token, allow_blank: true
end
