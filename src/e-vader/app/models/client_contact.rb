class ClientContact < ActiveRecord::Base
	belongs_to :client
	belongs_to :contact

	validates :value, :client_id, :contact_id, presence: true
end
