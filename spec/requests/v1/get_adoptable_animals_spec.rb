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

  describe 'get animal by search', :type => :request do

    before do
      post '/v1/adoptable_animals', params: { :species => 'cat', :breed => 'tuxedo', :name => "velma", :age => 'adolescent', :sex => "female"}
    end
      
    it 'returns an adoptable animal by species' do
      get '/v1/adoptable_animals?species=cat'
      expect(JSON.parse(response.body)[0]['species']).to eq('cat')
    end

    it 'returns an adoptable animal by breed' do
      get '/v1/adoptable_animals?breed=tuxedo'
      expect(JSON.parse(response.body)[0]['breed']).to eq('tuxedo')
    end

    it 'returns an adoptable animal by name' do
      get '/v1/adoptable_animals?name=velma'
      expect(JSON.parse(response.body)[0]['name']).to eq('velma')
    end

    it 'returns an adoptable animal by age' do
      get '/v1/adoptable_animals?age=adolescent'
      expect(JSON.parse(response.body)[0]['age']).to eq('adolescent')
    end
  
    it 'returns an animal by sex' do
      get '/v1/adoptable_animals?sex=female'
      expect(JSON.parse(response.body)[0]['sex']).to eq('female')
    end
  end
  
end