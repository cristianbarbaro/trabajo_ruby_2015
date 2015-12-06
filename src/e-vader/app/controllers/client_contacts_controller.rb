class ClientContactsController < ApplicationController
	before_action :get_contact_and_client, only: [:show, :edit, :update, :destroy]

	def index
		client_id = params[:client_id]
		@contacts = ClientContact.where(client_id: client_id)
		@client = Client.find(client_id)
	end

	def new
		@contact = ClientContact.new
		@client = Client.find(params[:client_id])
	end

	def edit
	end

	def create
		@contact = ClientContact.new(client_contact_params)
    if @contact.save
      redirect_to client_client_contacts_url, notice: 'La información de ClientContactsController se ha creado exitosamente.'
    else
    	@client = Client.find(params[:client_id])
      render :new
    end
	end

	def show
	end

	def update
		if @contact.update(client_contact_params)
			redirect_to client_client_contacts_url, notice: 'La info de contacto se ha actualizado correctamente.'
		else
			render :edit
		end
	end

	def destroy
		@contact.destroy
		redirect_to client_client_contacts_url , notice: 'La info de contacto se ha eliminado exitosamente.'
	end

	private
		def get_contact_and_client
			@client = Client.find(params[:client_id])
			@contact = ClientContact.find(params[:id])
		end

		def client_contact_params
	 	 params.require(:client_contact).permit(:contact_type, :contact_id, :client_id, :value)
	  end

end
