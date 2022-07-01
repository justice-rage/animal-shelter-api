require 'rails_helper'

describe "post a adoptable animal route", :type => :request do

  before do
    post '/v1/adoptable_animals', params: { :species => 'cat', :breed => 'tabby', :name => 'leo', :age => '1', :sex => 'male' }
  end

  it 'returns the adoptable animal name' do
    expect(JSON.parse(response.body)['species']).to eq('cat')
  end

  it 'returns the adoptable animal breed' do
    expect(JSON.parse(response.body)['breed']).to eq('tabby')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end