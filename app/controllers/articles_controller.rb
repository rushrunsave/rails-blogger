class ArticlesController < ApplicationController
	include ArticlesHelper

	def new
		@article = Article.new
	end	

	def create
		@article = Article.new(article_params)
		@article.save
		redirect_to article_path(@article)
	end	

	def edit
		@article = Article.find(params[:id])
	end	

	def index
		@articles = Article.all
	end	

	def update
 		@article = Article.find(params[:id])
    	@article.update(article_params)
    	flash.notice = "Article '#{@article.title}' Updated!"
     	redirect_to article_path(@article)
	end

	def show
		@article = Article.find(params[:id])
	end	

	def destroy
		@article = Article.find(params[:id])
		article.destroy()
		redirect_to action: :index, notice: 'Deleted'
	end	

end
