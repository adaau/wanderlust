class Place < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :months
  has_many :bookmarks

  # review-denis | need category
  before_save :update_months_names

  def update_months_names
    self.month_names = self.months.select(:name).pluck(:name).join(', ')
  end
end
