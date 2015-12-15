class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :bookmarks

  # class << self
  # def serialize_from_session(key,salt)
  #   record = to_adapter.get(key[0].to_param)
  #   record if record && record.authenticatable_salt == salt
  # end
  # end

end
