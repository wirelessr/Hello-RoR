class User < ApplicationRecord
    validates :first_name, presence: true, length: { minimum: 1 }
    validates :last_name, presence: true, length: { minimum: 1 }
    GENDER = ["male", "female", "others"]
    validates_inclusion_of :gender, :in => GENDER
    validates :age, presence: true, numericality: { only_integer: true }
end
