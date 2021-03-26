require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'associations' do
    it { should belong_to(:seat) }
    it { should belong_to(:show_time) }
    it { should belong_to(:user) }
  end
end
