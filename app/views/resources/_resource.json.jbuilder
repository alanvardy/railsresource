json.extract! resource, :id, :title, :url, :description, :created_at, :updated_at
json.url resource_url(resource, format: :json)
