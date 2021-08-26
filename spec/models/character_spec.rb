require 'rails_helper'

RSpec.describe Character, type: :model do
  it'should have a name' do 
    character = Character.create
    expect(character.errors[:name]).to_not be_empty
  end
end
