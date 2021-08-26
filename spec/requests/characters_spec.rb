require 'rails_helper'

RSpec.describe "Characters", type: :request do
  describe "GET /index" do
    it "gets the list of characters" do
      Character.create name: 'Dracula', age: 590, enjoys: 'blood and darkness'

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
        enjoys:'blood and darkness'
      }
    }
      post '/characters', params: character_params
      new_character = Character.first
      expect(response).to have_http_status(200)
      expect(new_character.name).to eq 'Dracula'
      expect(new_character.age).to eq 590
      expect(new_character.enjoys).to eq 'blood and darkness'
    end
  end

  describe "PATCH /update" do
    it 'updates a character' do
      character_params = {
        character: {
        name: 'Dracula',
        age: 590,
        enjoys:'blood and darkness'
      }
    }
    post '/characters', params: character_params
    character = Character.first
    updated_character_params = {
      character: {
      name: 'Dracula',
      age: 590,
      enjoys:'drinking blood and darkness'
    }
  }
    patch "/characters/#{character.id}", params: updated_character_params
    updated_character = Character.find(character.id)
    expect(response).to have_http_status(200)
    expect(updated_character.enjoys).to eq 'drinking blood and darkness'
    end
  end

  describe "DELETE /destroy" do
    it 'deletes a character' do
     character_params = {
        character: {
          name: 'Dracula',
          age: 590,
          enjoys:'blood and darkness'
        }
      }
      post '/characters', params:character_params
      character = Character.first
      delete "/characters/#{character.id}"
      expect(response).to have_http_status(200)
      characters = Character.all
      expect(characters).to be_empty
    end
  end
  describe "cannot create a character without valid attributes" do
    it 'cannot create a character without a name' do
      character_params = {
        character: {
          age: 590,
          enjoys:'blood and darkness'
        }
      }
      post '/characters', params: character_params
      character = JSON.parse(response.body)
      expect(response).to have_http_status (422)
      expect(character['name']).to include "can't be blank"
    end
  end

  describe "cannot create a character without valid attributes" do
    it 'cannot create a character without a age' do
      character_params = {
        character: {
          name: 'Dracula',
          enjoys:'blood and darkness'
        }
      }
      post '/characters', params: character_params
      character = JSON.parse(response.body)
      expect(response).to have_http_status (422)
      expect(character['age']).to include "can't be blank"
    end
  end

  describe "cannot create a character without valid attributes" do
    it 'cannot create a character without a enjoys' do
      character_params = {
        character: {
          name: 'Dracula',
          age: 590
        }
      }
      post '/characters', params: character_params
      character = JSON.parse(response.body)
      expect(response).to have_http_status (422)
      expect(character['enjoys']).to include "can't be blank"
    end
  end

  describe "cannot create a character without valid attributes" do
    it 'cannot create a character with less than 10 characters in enjoys' do
      character_params = {
        character: {
          name: 'Dracula',
          age: 590,
          enjoys:'blood'
        }
      }
      post '/characters', params: character_params
      character = JSON.parse(response.body)
      expect(response).to have_http_status (422)
      expect(character['enjoys']).to include "minimum is 10 characters"
    end
  end
end
