class Category < ApplicationRecord
  has_many :topics
  has_many :resources, through: :topics

  def self.get(id)
    if id.nil?
      return Rails.cache.fetch('models') { Rails.logger.info "NOT CACHED"; find_by(title: 'Models') }
    else
      id.capitalize!
    end

    file_not_found if Category.all.none? { |cat| cat.title == id }

    Rails.cache.fetch(id) { Rails.logger.info "NOT CACHED"; find_by(title: id) }
  end

  def file_not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
