require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(5).is_at_most(50) }
    
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(2).is_at_most(250) }
    
    it { should validate_presence_of(:keywords) }
    it { should validate_length_of(:keywords).is_at_least(5).is_at_most(50) }
  end

  describe 'associations' do
    it { should have_many_attached(:images) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should belong_to(:user) }
  end
end