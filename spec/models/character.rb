require "rails_helper"

describe 'Character PORO' do
  before :each do
    json = File.read('./fixtures/phoenix_members_gryffindor.json')
    members = JSON.parse(json)

    @sirius_hash = members.first
    @abe_hash = members.second

    @sirius = Character.new(@sirius_hash)
    @abe = Character.new(@abe_hash)
  end

  it 'can initialize with a hash' do
    expect(@sirius).to be_an_instance_of(Character)
    expect(@abe).to be_an_instance_of(Character)
  end

  it 'has attributes name, role, house, patronus' do
    expect(@abe.name).to eq(@abe_hash['name'])
    expect(@abe.house).to eq(@abe_hash['house'])
    expect(@abe.role).to eq(@abe_hash['role'])
    expect(@abe.patronus).to eq(@abe_hash['patronus'])
  end

  it 'has default attributes for role, patronus if nil' do
    expect(@sirius.name).to eq(@sirius_hash['name'])
    expect(@sirius.house).to eq(@sirius_hash['house'])
    expect(@sirius.role).to eq('none')
    expect(@sirius.patronus).to eq('unknown')
  end
end
