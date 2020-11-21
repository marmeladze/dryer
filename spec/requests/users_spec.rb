require 'web_helper'

RSpec.describe '/users' do
  context 'POST' do
    context 'with valid input' do 
      let(:input) {
        {
          first_name: 'Demba',
          last_name: 'Ba',
          age: 31
        }
      }


      it 'should succeed' do 
        post_json '/users', input
        expect(last_response.status).to eq(200)

        user = parsed_body

        expect(user['id']).not_to be_nil
        expect(user['first_name']).to eq('Demba')
        expect(user['last_name']).to eq('Ba')
        expect(user['age']).to eq(31)
      end
    end

    context "with invalid input" do
      let(:input) do
        {
          last_name: "Ba",
          age: 32,
        }
      end

      it "should return an error" do
        post_json "/users", input
        expect(last_response.status).to eq(422)
        user = parsed_body
        expect(user["errors"]["first_name"]).to include("is missing")
      end
    end



  end
end