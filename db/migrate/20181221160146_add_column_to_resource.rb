class AddColumnToResource < ActiveRecord::Migration[5.2]
  def change
    add_reference :resources, :source, foreign_key: true
  end
end
