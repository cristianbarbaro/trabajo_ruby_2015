class Contact < ActiveRecord::Base
	has_many :client_contacts
	has_many :clients, through: :client_contacts
	
	validates :contact_type, presence: true
	validates_uniqueness_of :contact_type
end
