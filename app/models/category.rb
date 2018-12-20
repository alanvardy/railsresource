class Category < ApplicationRecord
  has_many :topics
  has_many :resources, through: :topics

  def self.get(id)
    if id.nil?
      return find_by(title: 'Models')
    else
      id.capitalize!
    end
    file_not_found if Category.all.none? {|t| t.title == id}

    find_by(title: id)
  end

  def file_not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
