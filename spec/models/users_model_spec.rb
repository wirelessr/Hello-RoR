require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".validate" do

    it "is valid" do
      user = User.new(:first_name => 'John', :last_name => 'Doe', :age => 25, :gender => 'male')
      expect( user ).to be_valid
      
      user = User.new(:first_name => 'John', :last_name => 'Doe', :age => 25, :gender => 'female',
                      :address => {"country" => 'United States'})
      expect( user ).to be_valid
      
      user = User.new(:first_name => 'John', :last_name => 'Doe', :age => 25, :gender => 'female',
                      :address => {"country" => 'United States', "address_1" => 'United States', "address_2" => 'United States'})
      expect( user ).to be_valid
    end

    it "is invalid without name" do
      user = User.new(:first_name => '', :last_name => 'Doe', :age => 25, :gender => 'male')
      expect( user ).to_not be_valid
      
      user = User.new(:first_name => 'John', :last_name => '', :age => 25, :gender => 'male')
      expect( user ).to_not be_valid
    end

    it "is invalid with incorrect age" do
      user = User.new(:first_name => 'John', :last_name => 'Doe', :age => 0, :gender => 'male')
      expect( user ).to_not be_valid
      
      user = User.new(:first_name => 'John', :last_name => 'Doe', :age => -10, :gender => 'male')
      expect( user ).to_not be_valid
      
      user = User.new(:first_name => 'John', :last_name => 'Doe', :gender => 'male')
      expect( user ).to_not be_valid
    end

    it "is invalid with incorrect gender" do
      user = User.new(:first_name => 'John', :last_name => 'Doe', :age => 25, :gender => 'maled')
      expect( user ).to_not be_valid
    end
    
    it "is invalid with incorrect address" do
      user = User.new(:first_name => 'John', :last_name => 'Doe', :age => 25, :gender => 'male',
                      :address => {:address_3 => '123'})
      expect( user ).to_not be_valid
    end
  end
end