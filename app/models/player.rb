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
class Player < ApplicationRecord
  belongs_to :room
  belongs_to :user
  belongs_to :station, optional: true

  after_commit do
    RoomChannel.broadcast_to(room, command: 'loadRoomPlayers', params: room.id, user: user)
    RoomChannel.broadcast_to(room, move: [station.latitude, station.longitude], name: station.name)
  end

  validates :user, uniqueness: { scope: :room_id }
end
