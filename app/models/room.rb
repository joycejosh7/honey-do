class Room < ApplicationRecord
    has_many :chores
    
    validates :name, presence: true

    accepts_nested_attributes_for :chores, reject_if: :all_blank
end
