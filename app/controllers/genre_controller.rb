class GenreController < ApplicationController


	def index
		@genres = Genre.all
  		 
	end
	def show
		@genre = Genre.find(params[:id])
	end
	def new
		@genre = Genre.new

	end
	def create
    	@genre = Genre.new(article_params)
   		@genre.save

   		flash.notice = "Genre '#{@genre.title}' has been created!"

   		redirect_to genre_path(@genre)
  	end
  	def edit
 		@genre = Genre.find(params[:id])
	end
	def destroy
 		@genre = Genre.find(params[:id])
 		@genre.destroy

 		flash.notice = "Genre '#{@genre.title}' has been deleted!"

 		redirect_to genre_path

	end
	def update
		@genre = Genre.find(params[:id])
		@genre.update(article_params)
flash.notice = "Genre '#{@genre.title}' has been deleted!"

 		redirect_to genre_path(@genre)
	end



	 
end
