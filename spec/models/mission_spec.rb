require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many(:astronauts).through(:astronaut_missions)}
  end

  describe 'Model Methods' do
    it 'puts missions in alphabetical order' do
      mission1 = Mission.create!(title: 'Apollo 13', time_in_space: 1)
      mission2 = Mission.create!(title: 'Gemini 7', time_in_space: 2)
      mission3 = Mission.create!(title: 'Capricorn 4', time_in_space: 3)

      expect(Mission.alpha_sort).to eq([mission1, mission3, mission2])
    end
  end
end
