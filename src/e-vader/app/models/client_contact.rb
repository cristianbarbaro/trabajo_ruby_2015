class ClientContact < ActiveRecord::Base
	belongs_to :client, inverse_of: :client_contacts
	belongs_to :contact

	validates_presence_of :client
	validates :value, :contact_id, presence: true
end
