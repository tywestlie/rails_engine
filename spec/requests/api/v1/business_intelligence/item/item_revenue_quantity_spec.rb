require 'rails_helper'

describe 'Items buisness intelligence' do
  it 'returns items with most revenue' do
    item1 = create(:item)
    item2 = create(:item)

    invoice_item1 = create(:invoice_item, quantity: 1, item: item2, unit_price: 1000.00)
    invoice_item2 = create(:invoice_item, quantity: 1,  item: item1, unit_price: 20.00)

    get "/api/v1/items/most_revenue?quantity=#{5}"

    expect(response).to be_successful
    expect(item2.id).to eq(Item.revenue_by_quantity(2).first.id)
  end
end