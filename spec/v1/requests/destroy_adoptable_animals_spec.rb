require 'rails_helper'

describe 'destroy route', :type => :request do

  before do
    post '/v1/adoptable_animals', params: { :species => 'cat', :breed => 'tuxedo', :name => "velma", :age => 'adolescent', :sex => "female"}
    @animal_id = JSON.parse(response.body)['id']
    delete "/v1/adoptable_animals/#{@animal_id}"
  end

  it 'returns success status' do
    expect(response).to have_http_status(:success)
  end

  it 'returns success message' do
    expect(JSON.parse(response.body)['message']).to eq('Destruction successful.')
  end
end