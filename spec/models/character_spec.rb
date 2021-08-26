require 'rails_helper'

RSpec.describe Character, type: :model do
  it'should have a name age and enjoys' do 
    character = Character.create
    expect(character.errors[:name]).to_not be_empty
    expect(character.errors[:age]).to_not be_empty
    expect(character.errors[:enjoys]).to_not be_empty
  end
end
