require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:reservations) }
  end

  describe 'validations' do
    it { is_expected.to callback(:set_role).before(:validation) }
  end

  describe 'validations' do
    it { is_expected.to callback(:set_role).before(:validation) }
  end

  it 'test user model methods' do
    FactoryBot.create(:role)
    u = FactoryBot.create(:user)
    expect(u.role.name).to eq('customer')
    expect(u.admin?).to eq(false)
  end
end
