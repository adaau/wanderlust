class Bookmark < ActiveRecord::Base
  belongs_to :place
  belongs_to :user
  validates :list, presence: true

  before_save :update_columns

  def update_columns
    self.place_name = self.place.name
    self.list_number = Date::MONTHNAMES.index(self.list)
  end
end
