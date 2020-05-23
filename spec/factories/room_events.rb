# frozen_string_literal: true

# == Schema Information
#
# Table name: room_events
#
#  id         :bigint           not null, primary key
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_room_events_on_room_id  (room_id)
#  index_room_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (room_id => rooms.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :room_event do
    room { nil }
    message { 'MyText' }
  end
end
