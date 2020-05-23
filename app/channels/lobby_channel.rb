# frozen_string_literal: true

class LobbyChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'Lobby'
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
