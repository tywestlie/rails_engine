require 'rails_helper'

describe 'relationships' do
  let(:customer){ create(:customer)}
  let(:merchant){ create(:merchant)}

  it 'returns the associated invoice' do
    invoices = create_list(:invoice, 5,  merchant: merchant, customer: customer)
    transaction = create(:transaction, invoice: invoices[0])


    get "/api/v1/transactions/#{transaction.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice["id"]).to eq(transaction.invoice.id)
  end
end