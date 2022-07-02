require 'rails_helper'

describe "get all adoptable animals route", :type => :request do
  let!(:adoptable_animals) { FactoryBot.create_list(:adoptable_animal, 100)}

  before { get '/v1/adoptable_animals'}

  it 'returns all adoptable animals' do
    # Passing: rake db:reset fixed failing test
    #             - unsure how
    expect(JSON.parse(response.body).size).to eq(100)
  end

  it 'returns 25 beasts at a time' do
    get '/v1/adoptable_animals?page=1'
    expect(JSON.parse(response.body).size).to eq(25)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end