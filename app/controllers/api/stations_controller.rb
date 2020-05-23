# frozen_string_literal: true

module Api
  class StationsController < Api::BaseController
    def index
      render json: Station.all
    end
  end
end
