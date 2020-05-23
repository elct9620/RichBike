# frozen_string_literal: true

# == Schema Information
#
# Table name: players
#
#  id         :bigint           not null, primary key
#  calories   :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :bigint           not null
#  station_id :bigint           default(1)
#  user_id    :bigint           not null
#
# Indexes
#
#  index_players_on_room_id  (room_id)
#  index_players_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (room_id => rooms.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Player, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
