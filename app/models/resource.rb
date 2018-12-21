# frozen_string_literal: true

class Resource < ApplicationRecord
  belongs_to :topic
  belongs_to :source
end
