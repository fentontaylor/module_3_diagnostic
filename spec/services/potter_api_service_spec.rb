require 'rails_helper'

describe 'PotterApiService' do
  context '#get_members' do
    it 'returns a parsed json hash of Phoenix members for a house' do
      members = File.open('./fixtures/phoenix_members_gryffindor.json')
      url = "https://www.potterapi.com/v1/characters?key=$2a$10$JBNoRo7G/4R.8KaIfDDqk.0i6.2llWK97mSxws2ozodD57i9EXHvW&orderOfThePhoenix=true&house=Gryffindor"
      stub_request(:get, url).to_return(status: 200, body: members)

      members = PotterApiService.new.get_members('Gryffindor')

      expect(members).to be_an Array
      expect(members.count).to eq(21)

      sirius = members.first
      expect(sirius['name']).to eq('Sirius Black')
      expect(sirius['house']).to eq('Gryffindor')
      expect(sirius['role']).to be nil
      expect(sirius['patronus']).to be nil

      abe = members.second
      expect(abe['name']).to eq('Aberforth Dumbledore')
      expect(abe['house']).to eq('Gryffindor')
      expect(abe['role']).to eq("Owner, Hog's Head Inn")
      expect(abe['patronus']).to eq('goat')
    end
  end
end
