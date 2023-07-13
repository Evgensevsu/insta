require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe "validations" do
    subject { User.new(email: "test@example.com", password: "password") }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password).on(:create) }
    it { should validate_length_of(:password).is_at_least(6).on(:create) }
  end
end