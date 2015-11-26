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
      redirect_to @invoice, notice: 'Invoice was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /invoices/1
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /invoices/1
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:description, :total_amount, :discharge_date, :client_id, :person_id)
    end
end
