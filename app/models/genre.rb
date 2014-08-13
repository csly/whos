class Genre < ActiveRecord::Base

	has_many :articles
end
