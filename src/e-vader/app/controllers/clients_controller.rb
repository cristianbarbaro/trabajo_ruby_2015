class ClientsController < ApplicationController
	before_action :get_client, only: [:show, :edit, :update, :destroy]

	# GET /clients
	def index
		@clients = Client.all
	end

	# GET /clients/1
	def show
		@age = calculate_age
		@annual_amount = amount_per_year
		@invoices_per_month = amount_invoice_per_month
		@invoiced = invoiced_people
	end

	# GET /clients/new (Equivalent to a "create")
	def new
		@client = Client.new
	end

	# GET /clients/1/edit
	def edit
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
    if @client.update(client_params)
      redirect_to @client, notice: 'El cliente se ha actualizado exitosamente.'
    else
      render :edit
    end
	end

	# DELETE /clients/1
	def destroy
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

	  def get_client
	  	@client = Client.find(params[:id])
	  end

	  def calculate_age
	  	now = Date.today
			birthdate = @client.birthdate
			now.year - birthdate.year - (birthdate.to_time.change(:year => now.year) > now ? 1 : 0)
	  end

	  # Returns a hash where key is year and value is total amount per year.
	  def amount_per_year
	  	@client.invoices.group("strftime('%Y',discharge_date)").sum("total_amount")
	  end

	  # Returns a hash where key is month and value is amount invoice per month.
	  def amount_invoice_per_month
	  	current = Time.now.year.to_s
	  	@client.invoices.group("strftime('%m',discharge_date)")
	  	.having("strftime('%Y',discharge_date) = ?", current).count()
	  end

	  # Returns a hash with five people than has been more invoiced. 
	  # Key is person_id and value is times invoiced amount.
	  def invoiced_people
	  	invoiced = @client.people.group(:person_id).limit(5).count
	  	invoiced.sort_by {|key, value| value}.reverse.to_h
	  end

end
