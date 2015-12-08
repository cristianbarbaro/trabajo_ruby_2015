require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase

  setup do
  	@client = clients(:one)
  	@person = people(:one)
  end

  test "should not save without data" do
  	invoice = Invoice.new
  	assert_not invoice.save
  end

  test "should save invoice with correct data" do
  	invoice = Invoice.create(
  								description: "Esta factura es de un test",
  								total_amount: 400.0,
  								discharge_date: Time.now.strftime("%Y-%m-%d"),
  								client_id: @client.id,
  								person_id: @person.id
							)
  	assert invoice.save
  end

	test "should not save without description" do
		invoice = Invoice.create(
								description: nil,
								total_amount: 400.0,
								discharge_date: Time.now.strftime("%Y-%m-%d"),
								client_id: @client.id,
								person_id: @person.id
						)
		assert_not invoice.save
	end

	test "should not save with negative total amount" do
		invoice = Invoice.create(
								description: "Gato",
								total_amount: -400.0,
								discharge_date: Time.now.strftime("%Y-%m-%d"),
								client_id: @client.id,
								person_id: @person.id
						)
		assert_not invoice.save
	end

end
