require 'rails_helper'

RSpec.describe Screen, type: :model do
  describe 'associations' do
    it { should have_many(:show_times) }
    it { should have_many(:movies) }
    it { should have_many(:slots) }
    it { should have_many(:movie_dates) }
    it { should have_many(:screens_seats) }
    it { should have_many(:seats) }
  end
end
