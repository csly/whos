class Article < ActiveRecord::Base

default_scope {order(created_at: :desc)}  
   
	has_many :attachments 
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	acts_as_taggable 
	acts_as_taggable_on :genres, :countries, :types


	def tag_list
 	 self.tags.map(&:name).join(', ')
	end
		def genre_list
 	 self.genres.map(&:name).join(', ')
	end
		def country_list
 	 self.countries.map(&:name).join(', ')
	end
		def type_list
 	 self.types.map(&:name).join(', ')
	end
 

	 

	def preview
		body[0..300]  +  "  "
	end 
  
 	 def self.featured_article
    	where :featured => true 
  	end
  	 def self.unfeatured_article
    	where :featured => false 
  	end

   
end 