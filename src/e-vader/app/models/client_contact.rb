class ClientContact < ActiveRecord::Base
	belongs_to :clients
	belongs_to :contacts
end
