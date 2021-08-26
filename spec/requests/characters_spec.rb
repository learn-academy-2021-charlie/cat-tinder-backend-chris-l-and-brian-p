require 'rails_helper'

RSpec.describe "Characters", type: :request do
  describe "GET /index" do
    it "gets the list of characters" do
      Character.create name: 'Dracula', age: 590, enjoys: 'blood'

      get '/characters'

      character = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(character.length).to eq 1
    end
  end
  describe "POST /create " do 
    it "creates a character" do
      character_params = {
      character: {
        name: 'Dracula',
        age: 590,
        enjoys:'blood'
      }
    }
    post '/characters', params: character_params
    new_character = Character.first
    expect(response).to have_http_status(200)
    expect(new_character.name).to eq 'Dracula'
    expect(new_character.age).to eq 590
    expect(new_character.enjoys).to eq 'blood'
  end
 end
end
