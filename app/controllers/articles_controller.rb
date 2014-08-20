class ArticlesController < ApplicationController
	include ArticlesHelper


	http_basic_authenticate_with :name => "bucks", :password => "testing"

	before_filter :require_login, only: [:new, :create, :edit, :update, :destroy]

	def index 
		@search = Article.all.search(params[:q])
	 	@one = Article.featured_article.limit(3) 
		@two =  Article.all
		@searched = @search.result.paginate(:page => params[:page], :per_page => 5)
		@articles = Article.all.paginate(:page => params[:page], :per_page => 5)
		@articles = @search.result.paginate(:page => params[:page], :per_page => 5)


  		 
	end


	def show
		@article = Article.find(params[:id])
	end
	def new
		@article = Article.new

	end
	def create
    	@article = Article.new(article_params)
   		@article.save

   		flash.notice = "Article '#{@article.title}' has been created!"

   		redirect_to article_path(@article)
  	end
  	def edit
 		@article = Article.find(params[:id])
	end
	def destroy
 		@article = Article.find(params[:id])
 		@article.destroy

 		flash.notice = "Article '#{@article.title}' has been deleted!"

 		redirect_to articles_path

	end
	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' Updated!"

		redirect_to article_path(@article)
	end
	def tagged
 		 if params[:tag].present? 
   		 @articles = Article.tagged_with(params[:tag])
 		 else 
   		 @articles = Article.all
  		end  
	end

	def type
 		 if params[:type].present? 
   		 @articles = Article.tagged_with(params[:type])
 		 else 
   		 @articles = Article.all
  		end  
	end

	 def featured
 		 if params[:featured].present? 
   		 @articles = Article.featured_article.find(params[:featured])
 		 else 
   		 @articles = Article.all
  		end  
	end


	 def featured_article
 		 if params[:featured].present? 
   		 @articles = Article.featured_article.find(params[:featured])
 		 else 
   		 @articles = Article.all
  		end  
	end

	def genres
 		 if params[:genre].present? 
   		 @articles = Article.tagged_with(params[:genre])
 		 else 
   		 @articles = Article.all
  		end  
	end
  
 	def show_all
 		@articles = Article.all
 	end
	  


	 def high_only
 		 if params[:featured].present? 
   		 @articles = Article.find(params[:featured])
 		 else 
   		 @articles = Article.all
  		end  
	end


	 
end
