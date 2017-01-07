require "rails_helper"

describe OrderItem do
  describe 'validations' do
    it 'is valid with all attributes' do
      order = create(:order)
      outing = create(:outing)
      order_item = OrderItem.create(order_id: order.id, outing_id: outing.id, quantity: 1)

      expect(order_item).to be_valid
    end
  end

  describe 'relationships' do
    it 'belongs to an order' do
      order = create(:order)
      outing = create(:outing)
      order_item = OrderItem.create(order_id: order.id, outing_id: outing.id, quantity: 1)

      expect(order_item).to respond_to(:order)
    end

    it 'belongs to an outing' do
      order = create(:order)
      outing = create(:outing)
      order_item = OrderItem.create(order_id: order.id, outing_id: outing.id, quantity: 1)

      expect(order_item).to respond_to(:outing)
    end
  end

  describe 'methods' do
    it 'can calculate subtotal' do
      order = create(:order)
      outing = create(:outing)
      order_item = OrderItem.create(order_id: order.id, outing_id: outing.id, quantity: 5)

      expect(order_item.subtotal).to eq((outing.adjusted_cost * 5))
    end
  end
end
