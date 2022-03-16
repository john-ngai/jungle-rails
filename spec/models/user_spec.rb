require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    
    it 'returns a new user' do
      @user = User.create(
        name: 'John Ming',
        email: 'jming@gmail.com',
        password: '123456789',
        password_confirmation: '123456789'
      )
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_empty
    end

    it 'requires that the password length to be a minimum of 8 characters' do
      @user = User.new(
        name: 'John Ming',
        email: 'jming@gmail.com',
        password: '123456789',
        password_confirmation: '123456789'
      )
      expect(@user.password.length).to be >= 8
      expect(@user.password_confirmation.length).to be >= 8
    end

    it 'requires both password fields to be matching' do
      @user = User.new(
        name: 'John Ming',
        email: 'jming@gmail.com',
        password: '123456789',
        password_confirmation: '123456789'
      )
      expect(@user.password).to eql(@user.password_confirmation)
    end

    it 'creates a new user only when the email is unique' do
      @user = User.new(
        name: 'John Ming',
        email: 'jMiNg@GmAiL.cOm',
        password: '123456789',
        password_confirmation: '123456789'
      )  
      registered = User.find_by(email: @user.email.downcase)
      expect(registered).to eql nil
    end

    it 'requires the name and email fields not be blank' do
      @user = User.new(
        name: 'John Ming',
        email: 'jming@gmail.com',
      )
      expect(@user.name).not_to be_empty
      expect(@user.email).not_to be_empty
    end
  end

  describe '.authenticate_with_credentials' do
    it 'will login when provided with the correct credentials' do
      @user = User.create(
        name: 'John Ming',
        email: 'jming@gmail.com',
        password: '123456789',
        password_confirmation: '123456789'
      )
      expect(@user).to eql(User.authenticate_with_credentials('jming@gmail.com', '123456789'))
    end
  end
end
