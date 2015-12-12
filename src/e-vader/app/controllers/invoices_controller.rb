class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  def show
    @client = Client.find(@invoice.client_id)
    @person = Person.find(@invoice.person_id)
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      flash[:success] =  'La factura fue correctamente creada.'
      redirect_to @invoice
    else
      render :new
    end
  end

  # PATCH/PUT /invoices/1
  def update
    if @invoice.update(invoice_params)
      flash[:success] = 'La factura fue correctamente actualizada.'
      redirect_to @invoice
    else
      render :edit
    end
  end

  # DELETE /invoices/1
  def destroy
    @invoice.destroy
    flash[:success] = 'La factura fue eliminada.'
    redirect_to invoices_url
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(:description, :total_amount, :discharge_date, :client_id, :person_id)
    end
end
