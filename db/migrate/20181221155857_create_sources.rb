# frozen_string_literal: true

class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :title
      t.string :abbr
      t.string :color

      t.timestamps
    end
  end
end
