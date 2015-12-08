class Place < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :months
  has_many :bookmarks
end
