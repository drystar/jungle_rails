require 'rails-helper'

RSpec.describe User, type: model do

  describe 'Validations' do

    it "is valid with valid attributes" do
      @user = User.new(first_name : "Buddy", last_name: "theElf", email: "elf@gmail.com", password: "passwword", password_confirmation: "password")
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_nil
    end

    it "is invalid without a password" do
      @user = User.new(first_name : "Buddy", last_name: "theElf", email: "elf@gmail.com", password: nil, password_confirmation: "password")
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to be_nil
    end

    it "is invalid without a password confirmation" do
      @user = User.new(first_name : "Buddy", last_name: "theElf", email: "elf@gmail.com", password: "passwword", password_confirmation: nil)
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "is invalid without password and confirmation password matching" do
      @user = User.new(first_name : "Buddy", last_name: "theElf", email: "elf@gmail.com", password: "password", password_confirmation: "pa55w0rd")
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Passwords don't match")
    end



    it "is invalid when email is not unique" do
      @user = User.new(first_name : "Buddy", last_name: "theElf", email: "copy@gmail.com", password: "password", password_confirmation: "password")
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Email is not unique")
    end

    it "is invalid without an email" do
      @user = User.new(first_name : "Buddy", last_name: "theElf", email: nil, password: "password", password_confirmation: "password")
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end



    it "is invalid without first name" do
      @user = User.new(first_name : nil, last_name: "theElf", email: "elf@gmail.com", password: "password", password_confirmation: "password")
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "is invalid without last name" do
      @user = User.new(first_name : "Buddy", last_name: nil, email: "elf@gmail.com", password: "password", password_confirmation: "password")
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

  end
end 
