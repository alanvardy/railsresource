class Category < ApplicationRecord
  has_many :topics
  has_many :resources, through: :topics
end
