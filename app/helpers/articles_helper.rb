module ArticlesHelper
include ActsAsTaggableOn::TagsHelper

	def article_params
		params.require(:article).permit(:title, :body, :biog, :dead_line, :label, :website, :facebook, :twitter, :tag_list, :featured, :image, :label_list, :available_list, :genre_list, :artist_list)
	end
	
end
