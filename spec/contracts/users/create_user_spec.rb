require 'spec_helper'

RSpec.describe Dryer::Contracts::Users::CreateUser do

  context "given valid parameters" do 
    let(:input) {
      {
        "first_name": "Lorem",
        "last_name": "Ipsum",
        "age": 32
      }
    }

    let(:result) {
      subject.call(input)
    }

    it "is valid" do
      expect(result).to be_success
    end
  end

  context "requires first_name" do
    let(:input) {
      {
        "last_name": "John",
        "age": 21
      }
    } 

    let(:result) {
      subject.call(input)
    }

    it "is invalid" do 
      expect(result).to be_failure
      expect(result.errors[:first_name]).to include("is missing")
    end
  end

  context "requires last_name" do
    let(:input) {
      {
        "first_name": "Jack",
        "age": 22
      }
    } 

    let(:result) {
      subject.call(input)
    }

    it "is invalid" do 
      expect(result).to be_failure
      expect(result.errors[:last_name]).to include("is missing")
    end
  end

end