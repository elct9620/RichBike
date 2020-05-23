# frozen_string_literal: true

require 'net/http'
require 'json'

STATIONS_API = 'https://tcgbusfs.blob.core.windows.net/blobyoubike/YouBikeTP.json'

namespace :stations do
  desc 'Refresh Stations'
  task refresh: :environment do
    res = JSON.parse(Net::HTTP.get(URI(STATIONS_API)))
    stations_raw = res.dig('retVal')
    stations = stations_raw.map do |_, station|
      {
        number: station['sno'].to_i,
        name: station['sna'],
        latitude: station['lat'],
        longitude: station['lng']
      }
    end

    ActiveRecord::Base.connection.truncate(Station.table_name)
    Station.import stations
  end
end
