require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many(:missions).through(:astronaut_missions)}
  end

  describe 'Model Methods' do
    it 'calculates the average age of astronauts' do
      astronaut1 =  Astronaut.create!(name: 'astronaut1', age: 1, job: "job1")
      astronaut2 =  Astronaut.create!(name: 'astronaut2', age: 2, job: "job2")
      astronaut3 =  Astronaut.create!(name: 'astronaut3', age: 3, job: "job3")

      expect(Astronaut.average_age).to eq(2.0)
    end
  end
end
