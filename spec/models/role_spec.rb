require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'associations' do
    it { should have_one(:user) }
  end
end
