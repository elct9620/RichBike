# frozen_string_literal: true

class AddStationToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :station_id, :bigint, default: 1
  end
end
