class Chore < ApplicationRecord
    validates :title, presence: true
end
