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
      redirect_to @contact, notice: 'El tipo de contacto se ha creado exitosamente.'
    else
      render :new
    end
	end

	def update
		if @contact.update(params.require(:contact).permit(:contact_type))
			redirect_to @contact, notice: "El tipo de contacto se ha actualizado correctamente"
		else
			render :edit
		end
	end

	def destroy
		@contact.destroy
		redirect_to contacts_url , notice: 'El tipo de contacto se ha eliminado exitosamente.'
	end

	private
		def find_contact
			@contact = Contact.find(params[:id])
		end
	 
end
