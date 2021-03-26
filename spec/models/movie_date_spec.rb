require 'rails_helper'

RSpec.describe MovieDate, type: :model do
  describe 'associations' do
    it { should have_many(:show_times) }
    it { should have_many(:screens) }
    it { should have_many(:movies) }
    it { should have_many(:slots) }
  end
end
