require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { Product.new(name: 'iphone', price: 777, quantity: 222, category: Category.new(name: 'Test')) }

    describe 'Validations' do

      it 'is valid with valid attributes' do
        expect(subject).to be_valid
        expect(subject.errors.full_messages[0]).to be_nil
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid without price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eq ("Quantity can't be blank")
    end

    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Category can't be blank")
    end

  end

end