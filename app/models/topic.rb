# frozen_string_literal: true

class Topic < ApplicationRecord
  has_many :resources
  belongs_to :category

  def long_title
    "#{category.nil? ? 'Other' : category.title}: #{title}"
  end
end
