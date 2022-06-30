require 'rails_helper'

describe "get all adoptable animals route", :type => :request do
  let!(:adoptable_animals) { FactoryBot.create_list(:adoptable_animal, 20)}

  before { get '/adoptable_animals'}

  it 'returns all adoptable animals' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end