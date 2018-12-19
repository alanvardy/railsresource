class Topic < ApplicationRecord
  has_many :resources
  belongs_to :category

  def long_title
    "#{self.category.title}: #{self.title}"
  end
end
