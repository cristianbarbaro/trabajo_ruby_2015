class Contact < ActiveRecord::Base
	validates :type, presence: true
end
