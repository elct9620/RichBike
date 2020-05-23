# frozen_string_literal: true

class CreateRoomEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :room_events do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
