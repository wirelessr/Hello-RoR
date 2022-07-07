class AddressValidator < ActiveModel::Validator
    def validate(record)
        begin
            record.address.assert_valid_keys("country", "address_1", "address_2") if record.address
        rescue ArgumentError
            record.errors[:base] << record.address
        end
    end
end

class User
    include Mongoid::Document
    include Mongoid::Timestamps

    field :first_name, type: String
    field :last_name, type: String
    field :gender, type: String
    field :age, type: Integer
    field :address, type: Hash

    validates :first_name, presence: true, length: { minimum: 1 }
    validates :last_name, presence: true, length: { minimum: 1 }
    GENDER = ["male", "female", "others"]
    validates_inclusion_of :gender, :in => GENDER
    validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }

    validates_with AddressValidator

    has_one :shop
end
