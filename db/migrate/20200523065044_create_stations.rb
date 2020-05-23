# frozen_string_literal: true

class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.integer :number
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
