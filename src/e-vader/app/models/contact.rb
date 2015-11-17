class Contact < ActiveRecord::Base
	validates :contact_type, presence: true
	validates_uniqueness_of :contact_type
end
