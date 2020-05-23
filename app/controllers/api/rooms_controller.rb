# frozen_string_literal: true

module Api
  class RoomsController < Api::BaseController
    before_action :find_room, only: %i[join]

    def index
      render json: Room.pending
    end

    def create
      @room = current_user.rooms.create!(name: params[:name])

      render json: @room
    end

    def join
      @room.join(current_user)

      render json: @room
    end

    private

    def find_room
      @room = Room.find(params[:id])
    end
  end
end
