# frozen_string_literal: true

# == Schema Information
#
# Table name: stations
#
#  id         :bigint           not null, primary key
#  latitude   :float
#  longitude  :float
#  name       :string
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Station < ApplicationRecord
end
