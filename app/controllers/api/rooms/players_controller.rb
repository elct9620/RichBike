# frozen_string_literal: true

module Api
  module Rooms
    class PlayersController < Api::BaseController
      before_action :find_room

      def index
        render json: @room.users
      end

      private

      def find_room
        @room = Room.find(params[:room_id])
      end
    end
  end
end
