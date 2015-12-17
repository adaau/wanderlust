class Place < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :months
  has_many :bookmarks

  before_save :update_months_names
  before_save :update_categories_names

  def update_months_names
    self.month_names = self.months.select(:name).uniq.pluck(:name).join(', ')
  end

  def update_categories_names
    self.category_names = self.categories.select(:name).uniq.pluck(:name).join(', ')
  end

end
