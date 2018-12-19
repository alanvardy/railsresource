class AddAssociationToTopic < ActiveRecord::Migration[5.2]
  def change
    add_reference :topics, :category, foreign_key: true
  end
end
