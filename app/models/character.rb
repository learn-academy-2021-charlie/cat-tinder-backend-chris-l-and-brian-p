class Character < ApplicationRecord
    validates :name, :age, :enjoys , presence: true, length: { minimum: 10, too_short: "#{count} characters not enough" }
end
