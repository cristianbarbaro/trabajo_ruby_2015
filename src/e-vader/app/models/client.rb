class Client < ActiveRecord::Base
	validates :firstname, :lastname, :document_number, :genre, :birthdate, presence: true
	validates :identification_code_type, :identification_code_number, presence: true
end
