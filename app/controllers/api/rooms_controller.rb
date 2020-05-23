# frozen_string_literal: true

module Api
  class RoomsController < Api::BaseController
    before_action :find_room, except: %i[index create]

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

    def roll
      return unless @room.users.include?(current_user)

      service = RollService.new(@room, current_user)
      service.perform

      render json: service.state
    end

    private

    def find_room
      @room = Room.find(params[:id])
    end
  end
end
