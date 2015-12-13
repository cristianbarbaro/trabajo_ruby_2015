require 'test_helper'

class ClientTest < ActiveSupport::TestCase

  setup do
  	@client_one = clients(:one)
  	@client_two = clients(:two)
  	@client_three = clients(:three)
  	@invoice_two = invoices(:two) #Belongs to client_two.
  end

  test "should not save client without data" do
  	client = Client.new
  	assert_not client.save
  end

  test "should save client with correct data" do
  	client = Client.create({
									firstname: "Name",
									lastname: "Surname",
									birthdate: "1988-04-22",
									genre: "M",
									document_number: 12345678,
									identification_code_type: "CUIL",
									identification_code_number: "10/0",
									client_contacts_attributes: {"0"=>{"contact_id"=>"1", "value"=>"1515151", "client_id"=>"", "id"=>""}}
		})
  	assert client.save
  end

  test "should not save client with incorrect data" do
  	client = Client.create({
									firstname: "name12345",
									lastname: "Surname",
									birthdate: "1988-04-22",
									genre: "M",
									document_number: 12345678,
									identification_code_type: "CUIL",
									identification_code_number: "10/0",
		})
  	assert_not client.save
  end

  test "should save client with contact" do
  	#client = Client.new
  	#client.client_contacts.build
  	client = Client.create({
									firstname: "Name",
									lastname: "Surname",
									birthdate: "1988-04-22",
									genre: "M",
									document_number: 12345678,
									identification_code_type: "CUIL",
									identification_code_number: "10/0",
									#Agregamos un contacto:
									client_contacts_attributes: {"0"=>{"contact_id"=>"1", "value"=>"1515151", "client_id"=>"", "id"=>""}}	 
		})
  	assert client.save
  end

  test "should not save client without contact" do
  	client = Client.create({
									firstname: "Name",
									lastname: "Surname",
									birthdate: "1988-04-22",
									genre: "M",
									document_number: 12345678,
									identification_code_type: "CUIL",
									identification_code_number: "10/0"
		})
  	assert_not client.save
   end

  test "should not save cliente with attributes contacts in blank" do
		client = Client.create({
								firstname: "Name",
								lastname: "Surname",
								birthdate: "1988-04-22",
								genre: "M",
								document_number: 12345678,
								identification_code_type: "CUIL",
								identification_code_number: "10/0",
								client_contacts_attributes: {}
		})
		assert_not client.save
  end

  #Delete with invoices associated
  test "should delete client without invoices associated" do
  	assert @client_three.destroy
  end

  test "should not delete client with invoices associated" do
  	assert_not @client_two.destroy
  end

end
