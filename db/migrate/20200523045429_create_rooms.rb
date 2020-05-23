# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :state

      t.timestamps
    end
  end
end
