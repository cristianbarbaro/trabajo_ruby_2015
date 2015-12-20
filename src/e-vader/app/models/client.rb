class Client < ActiveRecord::Base
	has_many :client_contacts, dependent: :destroy, inverse_of: :client
	has_many :contacts, through: :client_contacts
	accepts_nested_attributes_for :client_contacts, reject_if: :all_blank, :allow_destroy => true
	has_many :invoices, dependent: :restrict_with_error
	has_many :people, through: :invoices

	validates :client_contacts, presence: true

	validates :firstname, :lastname, :document_number, :genre, :birthdate, presence: true
	validates :identification_code_type, :identification_code_number, presence: true
	validates :document_number, numericality: { only_integer: true, greater_than: 0 }
	validates :identification_code_type, inclusion: { in: %w(CUIT CUIL) }
	validates :genre, inclusion: { in: %w(M F) }
	validates :firstname, :lastname, format: { with: /\A[a-zA-Z\s]+\z/ }
	validates :birthdate, date: { after: Proc.new { Time.now - 95.year },
																before: Proc.new { Time.now }
															}
	validates :identification_code_number, format: { with: /\A\d{2}\/\d{1}\z/ }

	def age
		now = Date.today
		birthdate = self.birthdate
		now.year - birthdate.year - (birthdate.to_time.change(:year => now.year) > now ? 1 : 0)
	end

	def fullname
		"#{self.firstname} #{self.lastname}"
	end

	def invoiced_people(limit)

	end

	# Returns a hash where key is year and value is total amount per year.
	def amount_per_year
	  self.invoices.group("strftime('%Y',discharge_date)").sum("total_amount")
	end

	# Returns a hash where key is month and value is amount invoice per month.
	def invoice_per_month
		current = Time.now.year.to_s
		self.invoices.group("strftime('%m',discharge_date)")
		.having("strftime('%Y',discharge_date) = ?", current).count()
	end

end
