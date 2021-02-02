class Chore < ApplicationRecord
    validates :title, presence: true

    belongs_to :room

    accepts_nested_attributes_for :room, reject_if: :all_blank

    def room_name
        self.room ? self.room.name : "Room not available"
    end
end
