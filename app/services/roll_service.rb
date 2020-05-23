# frozen_string_literal: true

class RollService
  def initialize(room, player)
    @room = room
    @player = player
  end

  def perform
    state.update(station_id: next_station_id)
  end

  def state
    @state ||=
      @room.players.find_by(user: @player)
  end

  def dices
    [Random.rand(1..6), Random.rand(1..6)]
  end

  def stations
    @stations ||= Station.pluck(:id)
  end

  def next_station_id
    stations[(current_position + dices.sum) % stations.size]
  end

  def current_position
    @current_position ||=
      stations.index(state.station_id) || 0
  end
end
