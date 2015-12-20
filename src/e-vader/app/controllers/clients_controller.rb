class ClientsController < ApplicationController

	# Here I'm happy :)

	before_action :get_client, only: [:show, :edit, :update, :destroy]

	# GET /clients
	def index
		@clients = Client.all
	end

	# GET /clients/1
	def show
		@invoiced = invoiced_people
	end

	# GET /clients/new
	def new
		@client = Client.new
		@client.client_contacts.build
	end

	# GET /clients/1/edit
	def edit
	end

	# POST /clients
	def create
		@client = Client.new(client_params)
    if @client.save
    	flash[:success] = 'El cliente se ha creado exitosamente.'
      redirect_to @client
    else
      render :new
    end
	end

	# PATCH/PUT /clients/1
	def update
    if @client.update(client_params)
    	flash[:success] = 'El cliente se ha actualizado exitosamente.'
      redirect_to @client
    else
      render :edit
    end
	end

	# DELETE /clients/1
	def destroy
		if @client.destroy
			flash[:success] = 'El cliente se ha eliminado exitosamente.'
		else
			flash[:alert] = 'No se puede eliminar el cliente porque tiene facturas asociadas. Antes debe eliminar sus facturas.'
		end
		redirect_to clients_url
	end

	# Here I'm dead.

	private
		# To mass assignment.
	  def client_params
	    params.require(:client).permit(:firstname, :lastname, :document_number,
	    															 :identification_code_type, :identification_code_number,
	    															 :genre, :birthdate, client_contacts_attributes:
	    															 													[:id, :value, :contact_id, :client_id, :_destroy])
	  end

	  def get_client
	  	@client = Client.find(params[:id])
	  end

	  # Returns a hash with five people than has been more invoiced.
	  # Key is person_id and value is invoiced total amount.
	  def invoiced_people
			invoiced = @client.invoices.group(:person_id).sum(:total_amount)
			invoiced.sort_by {|key, value| value}.reverse.first(5).to_h
		end

	  # Here I'm not happy.
end
