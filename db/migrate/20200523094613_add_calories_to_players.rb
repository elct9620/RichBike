# frozen_string_literal: true

class AddCaloriesToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :calories, :integer, default: 0
  end
end
