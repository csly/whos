class ArticlesController < ApplicationController
	include ArticlesHelper

	http_basic_authenticate_with :name => "bucks", :password => "testing"

	before_filter :require_login, only: [:new, :create, :edit, :update, :destroy]

	def index
		@articles = Article.featured_article + Article.unfeatured_article 

  		 
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

	 def featured
 		 if params[:featured].present? 
   		 @articles = Article.find(params[:featured])
 		 else 
   		 @articles = Article.all
  		end  
	end
  
 
	  




	 
end
