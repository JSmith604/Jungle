require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(first_name: "First", last_name: "Last", email: "Alice@gmail.com", password: "password", password_confirmation: "password")
  }
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without an password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without an password_confirmation' do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid if password_confirmation does not match password' do
      subject.password_confirmation = "nope"
      expect(subject).to_not be_valid
    end
   
    before { described_class.create!(first_name: 'test', last_name: 'test', email: 'bob@gmail.com', password: "testPassword", password_confirmation: "testPassword")}
    it 'is not valid if the email already exists in the user database' do
      subject.email = "bob@gmail.com"
      expect(subject).to_not be_valid
      
    end
  end 
end


# RSpec.describe Product, :type => :model do
#   subject {
#     described_class.new(name: "name", price: 100, quantity: 10, 
#     category: Category.new({:name => "category"})
#     )
#   }
#   describe 'Validations' do
#     it 'is valid with valid attributes' do
#       expect(subject).to be_valid
#     end
#     it "is not valid without a name" do
#       subject.name = nil
#       expect(subject).to_not be_valid
#     end
#     it "is not valid without a price" do
#       subject.price_cents = nil
#       expect(subject).to_not be_valid
#     end
#     it "is not valid without a quantity" do
#       subject.quantity = nil
#       expect(subject).to_not be_valid
#     end
#     it "is not valid without a category" do
#       subject.category = nil
#       expect(subject).to_not be_valid
#     end
#   end
# end

