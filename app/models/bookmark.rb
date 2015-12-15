class Bookmark < ActiveRecord::Base
  belongs_to :place
  belongs_to :user
  validates :list, presence: true
end
