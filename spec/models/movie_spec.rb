require 'rails_helper'

RSpec.describe Movie, type: :model do
  let!(:book_one) { Movie.create(name: "The Count of Monte Cristo", active: false) }
  let!(:book_two) { Movie.create(name: "Animal Farm") }


  describe 'associations' do
    it { should have_many(:show_times) }
    it { should have_many(:screens) }
    it { should have_many(:slots) }
    it { should have_many(:movie_dates) }
  end

  it 'will check the default scope' do
    movies = Movie.all
    expect(movies.count).to eq(1)
  end
end
