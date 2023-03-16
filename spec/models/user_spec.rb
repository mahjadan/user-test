require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_email) { 'test@example.com' }
  it "is valid with valid attributes" do
    user = User.new(email: valid_email, name: 'test', birthdate: Date.today - 19.years)
    expect(user).to be_valid
  end
  it "is not valid without a email" do
    user = User.new(email: nil)
    expect(user).to be_invalid
  end
  it "is not valid when email is empty" do
    user = User.new(email: '')
    expect(user).to be_invalid
  end
  it "is not valid when email is not a valid email address" do
    user = User.new(email: 'test@xxx', name: 'test')
    expect(user).to be_invalid
  end
  it "is not valid without a name" do
    user = User.new(email: valid_email, name: '')
    expect(user).to be_invalid
  end
  it "is not valid without a birthdate" do
    user = User.new(email: valid_email, name: 'test')
    expect(user).to be_invalid
  end
  it "is not valid when birthdate is less than 18" do
    user = User.new(email: valid_email, name: 'test', birthdate: Date.today - 17.years)
    expect(user).to be_invalid
  end
  it "is not valid when email already exists" do
    user = User.new(email: valid_email, name: 'test', birthdate: Date.today - 19.years)
    user.save
    user_with_same_email = User.new(email: valid_email, name: 'test', birthdate: Date.today - 19.years)
    expect(user_with_same_email).to be_invalid
  end

  it "is not valid when email in uppercase already exists " do
    user = User.new(email: valid_email, name: 'test', birthdate: Date.today - 19.years)
    user.save
    user_with_same_email = User.new(email: valid_email.upcase, name: 'test', birthdate: Date.today - 19.years)
    expect(user_with_same_email).to be_invalid
  end
end
