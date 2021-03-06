require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
   setup do
    @client = clients(:one)
  end

  test "should create a client" do
    assert_difference('Client.count') do
      post :create, client: { firstname: @client.firstname,
      												lastname: @client.lastname,
      												document_number: @client.document_number,
      												genre: @client.genre,
      												birthdate: @client.birthdate,
      												identification_code_number: @client.identification_code_number, 
      												identification_code_type: @client.identification_code_type, 
                              client_contacts_attributes: {"0"=>{"contact_id"=>"1", "value"=>"1515151", "client_id"=>"", "id"=>""}}
      											}
    end
    assert_redirected_to client_path(assigns(:client))
  end

end
