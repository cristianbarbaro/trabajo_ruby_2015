class Contact < ActiveRecord::Base
	validates :contact_type, presence: true
end
