# frozen_string_literal: true

module Api
  class RoomsController < ApplicationController
    def index
      render json: Room.pending
    end

    def create
      @room = current_user.rooms.create(name: params[:name])

      render json: @room
    end
  end
end
