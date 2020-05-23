# frozen_string_literal: true

# == Schema Information
#
# Table name: rooms
#
#  id         :bigint           not null, primary key
#  name       :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_rooms_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Room < ApplicationRecord
  include AASM

  after_create_commit do
    ActionCable.server.broadcast('Lobby', command: :reload)
  end

  belongs_to :user

  enum state: {
    pending: 'pending',
    started: 'started',
    ended: 'ended'
  }

  aasm column: :state, enum: true do
    state :pending, initial: true
    state :started
    state :ended

    event :start do
      transitions from: :pending, to: :started, guard: :ready?
    end

    event :end do
      transitions from: :started, to: :ended
    end
  end

  validates :state, presence: true

  def ready?
    # TODO: players.reduce(true, &:ready?)
    true
  end
end
