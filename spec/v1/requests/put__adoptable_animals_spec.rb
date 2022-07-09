require 'rails_helper'

describe 'update an adoptable animal route', :type => :request do

  before do
    post '/v1/adoptable_animals', params: { :species => 'cat', :breed => 'tuxedo', :name => "velma", :age => 'adolescent', :sex => "female"}
    @animal_id = JSON.parse(response.body)['id']
    put "/v1/adoptable_animals/#{@animal_id}", params: { :name => 'big momma chonky', :age => 'adult' }
    get "/v1/adoptable_animals/#{@animal_id}"
  end

  it 'update adoptable animals name' do 
    expect(JSON.parse(response.body)['name']).to eq('big momma chonky')
  end

  it 'updates adoptable animals age' do
    expect(JSON.parse(response.body)['age']).to eq('adult')
  end

  it 'returns success status' do
    expect(response).to have_http_status(:success)
  end
end