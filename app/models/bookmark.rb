class Bookmark < ActiveRecord::Base
  belongs_to :place
  belongs_to :user
  validates :list, presence: true

  before_save :update_place_name

  def update_place_name
    self.place_name = self.place.name
  end
end
