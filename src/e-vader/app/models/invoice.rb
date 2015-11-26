class Invoice < ActiveRecord::Base
	belongs_to :clients
	belongs_to :people

	validates :description, :total_amount, :discharge_date, :client_id, :person_id, presence: true
end
