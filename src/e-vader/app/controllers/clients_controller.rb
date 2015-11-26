class ClientsController < ApplicationController

	# GET /clients
	def index
		@clients = Client.all
	end

	# GET /clients/1
	def show
		@client = Client.find(params[:id])
		@age = calculate_age
		@annual_amount = amount_per_year
	end

	# GET /clients/new (Equivalent to a "create")
	def new
		@client = Client.new
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
		# To mass assignment.
	  def client_params
	    params.require(:client).permit(:firstname, :lastname, :document_number,
	    															 :identification_code_type, :identification_code_number, 
	    															 :genre, :birthdate)
	  end

	  def calculate_age
	  	now = Date.today
			birthdate = @client.birthdate
			now.year - birthdate.year - (birthdate.to_time.change(:year => now.year) > now ? 1 : 0)
	  end

	  # Returns a hash when key is year and value is total amount per year.
	  def amount_per_year
	  	@client.invoices.group("strftime('%Y',discharge_date)").sum("total_amount")
	  end

end
