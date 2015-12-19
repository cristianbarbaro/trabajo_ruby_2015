class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :set_client

  # GET /clients/1/invoices
  def index
    @invoices = Invoice.where(client_id: params[:client_id])
  end

  # GET /clients/1/invoices/1
  def show
    @person = Person.find(@invoice.person_id)
  end

  # GET /clients/1/invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /clients/1/invoices/1/edit
  def edit
  end

  # POST /clients/1/invoices
  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      flash[:success] =  'La factura fue correctamente creada.'
      redirect_to client_invoice_url(@client, @invoice)
    else
      render :new
    end
  end

  # PATCH/PUT /clients/1/invoices/1
  def update
    if @invoice.update(invoice_params)
      flash[:success] = 'La factura fue correctamente actualizada.'
      redirect_to client_invoice_url
    else
      render :edit
    end
  end

  # DELETE /clients/1/invoices/1
  def destroy
    @invoice.destroy
    flash[:success] = 'La factura fue eliminada.'
    redirect_to client_invoices_url
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def set_client
      @client = Client.find(params[:client_id])
    end

    def invoice_params
      params.require(:invoice).permit(:description, :total_amount, :discharge_date, :client_id, :person_id)
    end
end
