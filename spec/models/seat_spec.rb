require 'rails_helper'

RSpec.describe Seat, type: :model do
  describe 'associations' do
    it { should have_many(:screens_seats) }
    it { should have_many(:screens) }
  end
end
