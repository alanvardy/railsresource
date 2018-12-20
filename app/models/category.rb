class Category < ApplicationRecord
  has_many :topics
  has_many :resources, through: :topics

  def self.get(id)
    if id.nil?
      return find_by(title: 'Models')
    else
      id.capitalize!
    end
    raise ActionController::RoutingError.new('Not Found') if Category.all.none? {|t| t.title == id}
    find_by(title: id)
  end
end
