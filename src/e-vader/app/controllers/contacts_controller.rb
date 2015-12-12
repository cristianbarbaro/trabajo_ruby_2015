class ContactsController < ApplicationController
	before_action :find_contact, only: [:show, :edit, :update, :destroy]

	def index
		@contacts = Contact.all
	end

	def show
	end

	def new
		@contact = Contact.new
	end

	def edit
		render :edit
	end

	def create
		@contact = Contact.new(params.require(:contact).permit(:contact_type))
		if @contact.save
			flash[:success] =  'El tipo de contacto se ha creado exitosamente.'
      redirect_to @contact
    else
      render :new
    end
	end

	def update
		if @contact.update(params.require(:contact).permit(:contact_type))
			flash[:success] =  "El tipo de contacto se ha actualizado correctamente"
			redirect_to @contact
		else
			render :edit
		end
	end

	def destroy
		cc = @contact.client_contacts
		if cc.empty?
			@contact.destroy
			flash[:success] = 'El tipo de contacto se ha eliminado exitosamente.'
		else
			flash[:alert] = 'No se puede eliminar el tipo de contacto porque tiene usuarios asociados.'
		end
		redirect_to contacts_url
	end

	private
		def find_contact
			@contact = Contact.find(params[:id])
		end
	 
end
