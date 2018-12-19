class Category < ApplicationRecord
  has_many :topics
  has_many :resources, through: :topics

  def self.get(id)
    case id
    when "models"
      find_by(title: 'Models')
    when "views"
      find_by(title: 'Views')
    when "controllers"
      find_by(title: 'Controllers')
    else
      find_by(title: 'Models')
    end
  end
end
