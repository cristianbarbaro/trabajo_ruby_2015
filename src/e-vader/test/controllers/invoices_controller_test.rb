require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
    @invoice = invoices(:one)
  end

  test "should get index" do
    get :index, client_id: @invoice.client_id
    assert_response :success
    assert_not_nil assigns(:invoices)
  end

  test "should get new" do
    get :new, client_id: @invoice.client_id
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post :create, client_id: @invoice.client_id, invoice:{
                              id: @invoice.id,
                              description: @invoice.description,
                              discharge_date: @invoice.discharge_date,
                              total_amount: @invoice.total_amount,
                              client_id: @invoice.client_id,
                              person_id: @invoice.person_id
                            }
    end

    assert_redirected_to client_invoice_path(@invoice.client_id, assigns(:invoice))
  end

  test "should show invoice" do
    get :show, client_id: @invoice.client_id, id: @invoice
    assert_response :success
  end

  test "should get edit" do
    get :edit, client_id: @invoice.client_id, id: @invoice
    assert_response :success
  end

  test "should update invoice" do
    patch :update, client_id: @invoice.client_id, id: @invoice, invoice: {
                                            description: @invoice.description,
                                            discharge_date: @invoice.discharge_date,
                                            total_amount: @invoice.total_amount,
                                            client_id: @invoice.client_id,
                                            person_id: @invoice.person_id
                                          }
    assert_redirected_to client_invoice_path(@invoice.client_id, assigns(:invoice))
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete :destroy, client_id: @invoice.client_id, id: @invoice
    end

    assert_redirected_to client_invoices_path
  end
end
