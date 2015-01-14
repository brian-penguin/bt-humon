class User < ActiveRecord::Base
  validates_uniqueness_of :device_token, allow_blank: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password_digest
end
