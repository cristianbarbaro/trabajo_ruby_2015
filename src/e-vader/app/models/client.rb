class Client < ActiveRecord::Base
	has_many :client_contacts, dependent: :destroy
	has_many :contacts, through: :client_contacts
	has_many :invoices
	has_many :people, through: :invoices

	validates :firstname, :lastname, :document_number, :genre, :birthdate, presence: true
	validates :identification_code_type, :identification_code_number, presence: true
	validates :document_number, numericality: { only_integer: true, greater_than: 0 }
	validates :identification_code_type, inclusion: { in: %w(CUIT CUIL) }
	validates :genre, inclusion: { in: %w(M F) }
	validates :firstname, :lastname, format: { with: /\A[a-zA-Z]+\z/ }
end
