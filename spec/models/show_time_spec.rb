require 'rails_helper'

RSpec.describe ShowTime, type: :model do
  describe 'associations' do
    it { should belong_to(:movie) }
    it { should belong_to(:slot) }
    it { should belong_to(:screen) }
    it { should belong_to(:movie_date) }
  end
end
