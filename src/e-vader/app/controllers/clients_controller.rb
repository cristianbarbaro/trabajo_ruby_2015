class ClientsController < ApplicationController

	# GET /clients
	def index
		@clients = Client.all
	end

	# GET /clients/1
	def show
		@client = Client.find(params[:id])
	end

	# GET /clients/new (Equivalent to a "create")
	def new
	end

	# GET /clients/1/edit
	def edit
		@client = Client.find (params[:id])
		render :edit
	end

	# POST /clients (Equivalent to a "store")
	def create
		#render plain: params[:client].inspect
		@client = Client.new(client_params)
    if @client.save
      redirect_to @client, notice: 'El cliente se ha creado exitosamente.'
    else
      render :new
    end
	end

	# PATCH/PUT /clients/1
	def update
		@client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to @client, notice: 'El cliente se ha actualizado exitosamente.'
    else
      render :edit
    end
	end

	# DELETE /clients/1
	def destroy
		@client = Client.find(params[:id])
		@client.destroy
		redirect_to clients_url , notice: 'El cliente se ha eliminado exitosamente.'
	end

	private
		#Esto viene a hacerse el tema de la asignacion masiva:
	  def client_params
	    params.require(:client).permit(:firstname, :lastname, :document_number, :genre,
	    															 :identification_code_type, :identification_code_number, 
	    															 :client_type, :birthdate)
	  end

end
