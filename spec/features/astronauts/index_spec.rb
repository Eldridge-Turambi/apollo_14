require 'rails_helper'

RSpec.describe 'Astronauts Index Page' do

  it 'visits astronaut index page and sees a list of the Astronaut at its attributes' do
    astronaut1 =  Astronaut.create!(name: 'astronaut1', age: 1, job: "job1")
    astronaut2 =  Astronaut.create!(name: 'astronaut2', age: 2, job: "job2")

    visit 'astronauts'

    expect(page).to have_content(astronaut1.name)
    expect(page).to have_content(astronaut1.age)
    expect(page).to have_content(astronaut1.job)

    expect(page).to have_content(astronaut2.name)
    expect(page).to have_content(astronaut2.age)
    expect(page).to have_content(astronaut2.job)
  end

  it 'displays the average age of all astronauts' do
    astronaut1 =  Astronaut.create!(name: 'astronaut1', age: 1, job: "job1")
    astronaut2 =  Astronaut.create!(name: 'astronaut2', age: 2, job: "job2")
    astronaut3 =  Astronaut.create!(name: 'astronaut3', age: 3, job: "job3")

    visit '/astronauts'

    expect(page).to have_content("Average age: #{Astronaut.average_age}")
  end

  it 'displays list of space missions in alphabetical order' do
    astronaut1 =  Astronaut.create!(name: 'astronaut1', age: 1, job: "job1")
    astronaut2 =  Astronaut.create!(name: 'astronaut2', age: 2, job: "job2")
    astronaut3 =  Astronaut.create!(name: 'astronaut3', age: 3, job: "job3")

    mission1 = Mission.create!(title: 'Apollo 13', time_in_space: 1)
    mission2 = Mission.create!(title: 'Gemini 7', time_in_space: 2)
    mission3 = Mission.create!(title: 'Capricorn 4', time_in_space: 3)

    visit '/astronauts'
    expect(page).to have_content(mission1.title)
    expect(page).to have_content(mission2.title)
    expect(page).to have_content(mission3.title)

    expect(mission1.title).to appear_before(mission3.title)
    expect(mission3.title).to appear_before(mission2.title)
    expect(mission1.title).to appear_before(mission3.title)
  end
end
