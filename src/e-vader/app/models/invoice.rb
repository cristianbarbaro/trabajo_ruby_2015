class Invoice < ActiveRecord::Base
	belongs_to :client
	belongs_to :person

	validates :description, :total_amount, :discharge_date, :client_id, :person_id, presence: true
end
