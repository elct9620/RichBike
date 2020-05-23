# frozen_string_literal: true

module Api
  module Rooms
    class EventsController < Api::BaseController
      before_action :find_room

      def index
        render json: @room
          .events.includes(:user)
          .recent.limit(5)
          .as_json(include: %i[user])
      end

      private

      def find_room
        @room = Room.find(params[:room_id])
      end
    end
  end
end
