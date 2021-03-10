require 'rails_helper'

RSpec.describe Product, :type => :model do
  subject {
    described_class.new(name: "name", price: 100, quantity: 10, 
    category: Category.new({:name => "category"})
    )
  }
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end
end

# RSpec.describe Widget, type: :model do
#   describe '#id' do
#   it 'should not exist for new records' do
#     @widget = Widget.new
#     expect(@widget.id).to be_nil
#   end

#   it 'should be auto-assigned by AR for saved records' do
#     @widget = Widget.new
    # we use bang here b/c we want our spec to fail if save fails (due to validations)
    # we are not testing for successful save so we have to assume it will be successful
#     @widget.save!

#     expect(@widget.id).to be_present
#   end
# end
# end
