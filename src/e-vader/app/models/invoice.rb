class Invoice < ActiveRecord::Base
	belongs_to :clients

	validates :description, :total_amount, :discharge_date, :client_id, presence: true
end
