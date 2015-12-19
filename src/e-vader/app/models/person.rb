class Person < ActiveRecord::Base
	has_many :invoices
	has_many :clients, through: :invoices

	validates :name, :identification_code_type, :identification_code_number, :person_type, presence: true
	validates :identification_code_type, inclusion: { in: %w(CUIT CUIL) }
	validates :person_type, inclusion: { in: %w(JURIDICA FISICA) }
end
