require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do @user = User.new(first_name: "Buddy", last_name: "theElf", email: "elf@gmail.com", password: "password", password_confirmation: "password")
  end

  describe 'Validations' do

    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it "is invalid without a password" do
      @user.password = nil
      expect(@user).not_to be_valid
    end

    it "is invalid without a password confirmation" do
      @user.password_confirmation = nil
      expect(@user).not_to be_valid
    end

    it "is invalid without password and confirmation password matching" do
      @user.password_confirmation = 123456
      expect(@user).not_to be_valid
    end

    it "is invalid when password is too short" do
      @user.password = "passw" 
      expect(@user).not_to be_valid
    end



    it "is invalid when email is already in use" do
      @user.save
      user1 = User.new(first_name: "Buddy", last_name: "theElf", email: "elf@gmail.com", password: "password", password_confirmation: "password")
      expect(user1).not_to be_valid
    end

    it "is invalid without an email" do
      @user.email = nil
      expect(@user).not_to be_valid
    end



    it "is invalid without first name" do
      @user.first_name = nil
      expect(@user).not_to be_valid
    end

    it "is invalid without last name" do
      @user.last_name = nil
      expect(@user).not_to be_valid
    end

  describe ".authenticate_with_credentials" do

    it "is invalid with an authenticated email" do
      user101 = User.create(first_name: "Buddy", last_name: "theElf", email: "elf@gmail.ca", password: "password", password_confirmation: "password")
      expect(User.authenticate_with_credentials("cd@gmail.com", "password")).to be_nil
    end

    it "is valid if the user can be authenticatd"
      user102 = User.create(first_name: "Buddy", last_name: "theElf", email: "elf@gmail.com", password: "password", password_confirmation: "password")
      expect(User.authenticate_with_credentials("elf@gmail.com", "password")).to be_valid
    end

    it "user is valid after removing whitespace"
      user103 = User.create(first_name: "Buddy", last_name: "theElf", email: "elf@gmail.com", password: "password", password_confirmation: "password")
      expect(User.authenticate_with_credentials("  elf@gmail.com", "password")).to be_truthy.and have_attributes(:email => "elf@gmail.com")
    end

    it "user is valid after changing to lowercase"
      user103 = User.create(first_name: "Buddy", last_name: "theElf", email: "elf@gmail.com", password: "password", password_confirmation: "password")
      expect(User.authenticate_with_credentials("eLF@gmail.com", "password")).to be_truthy.and have_attributes(:email => "elf@gmail.com")
    end

  end

end

