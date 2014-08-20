class Article < ActiveRecord::Base

default_scope {order(created_at: :desc)}  
   
	has_many :attachments 
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	acts_as_taggable 
	acts_as_taggable_on :genres, :artists, :labels, :availables


	def tag_list
 	 self.tags.map(&:name).join(', ')
	end
		def genre_list
 	 self.genres.map(&:name).join(', ')
	end
		def artist_list
 	 self.artists.map(&:name).join(', ')
	end
		def label_list
 	 self.labels.map(&:name).join(', ')
	end
	def available_list
 	 self.availables.map(&:name).join(', ')
	end
 

	 

	def preview
		body[0..498]  +  "  "
	end 
  
 	 def self.featured_article
    	where :featured => true 
  	end
  	 def self.unfeatured_article
    	where :featured => false 
  	end

   
end 