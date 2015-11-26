class Person < ActiveRecord::Base
	has_many :invoices
	has_many :clients, through: :invoices

	validates :name, :identification_code_type, :identification_code_number, presence: true
end
