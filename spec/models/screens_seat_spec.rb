require 'rails_helper'

RSpec.describe ScreensSeat, type: :model do
  describe 'associations' do
    it { should belong_to(:seat) }
    it { should belong_to(:screen) }
  end
end
