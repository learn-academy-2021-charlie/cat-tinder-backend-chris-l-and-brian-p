class Character < ApplicationRecord
    validates :name, :age, :enjoys, presence: true
    validates :enjoys , presence: true, length: { minimum: 10, too_short: "minimum is 10 characters"}
end
