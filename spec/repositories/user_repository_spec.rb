require 'spec_helper'

RSpec.describe Dryer::Repositories::UserRepository do
  context "create" do 
    it "creates a user" do
      user = subject.create(first_name: 'Numerius', last_name: 'Negidius', age: 27)

      expect(user).to be_a(Dryer::User)
      expect(user.id).not_to be_nil
      expect(user.first_name).to eq('Numerius')
      expect(user.last_name).to eq('Negidius')
      expect(user.age).to eq(27)
      expect(user.created_at).not_to be_nil
      expect(user.updated_at).not_to be_nil
    end
  end

  context "all" do
    before do
      subject.create(first_name: 'Nomen', last_name: 'Nescio', age: 26)
      subject.create(first_name: 'Numerius', last_name: 'Negidius', age: 27)
      subject.create(first_name: 'Aulus', last_name: 'Agerius', age: 28)
    end

    it "returns all users" do 
      users = subject.all
      expect(users.count).to eq(3)
      users.each { |user| expect(user).to be_a(Dryer::User) }
    end

  end
end