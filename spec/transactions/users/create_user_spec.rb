require 'spec_helper'

RSpec.describe Dryer::Transactions::Users::CreateUser do
  let(:user_repo) { double('UserRepo') }
  let(:user) { Dryer::User.new(id: 1, first_name: 'Demba') }

  subject { described_class.new(user_repository: user_repo) }

  context "with valid input" do 
    let(:input) {
      {
        "first_name": "Demba",
        "last_name": "Ba",
        "age": 31
      }
    }

    it "create a user" do 
      expect(user_repo).to receive(:create) { user }
      result = subject.call(input)
      expect(result).to be_success
      expect(result.success).to eq(user)
    end
  end


  context "with invalid input" do
    let(:input) {
      {
        last_name: "Ba",
        age: 31,
      }
    }

    it "does not create a user" do
      expect(user_repo).not_to receive(:create)
      result = subject.call(input)
      expect(result).to be_failure
      expect(result.failure.errors[:first_name]).to include("is missing")
    end
  end

end