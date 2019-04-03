class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :show_category]

    def index 
        @articles = Article.all.order('created_at DESC')
    end

    def new 
        @article = current_user.articles.build
    end 

    def create 
        @article = current_user.articles.build(article_params)
        if @article.save 
            redirect_to root_path
        else 
            render 'new'
        end
    end 

    def show 
        @article = Article.find(params[:id])
    end

    def edit 
        @article = Article.find(params[:id])        
    end

    def update 
        @article = Article.find(params[:id])        
        @article.update(article_params)

        redirect_to @article
    end 

    def destroy
        @article = Article.find(params[:id])        
        @article.delete 

        redirect_to root_path
    end

    def show_category
        @tag = params[:query]
        @articles = Article.where(tag: @tag)
    end 

    private 
        def article_params 
            params.require(:article).permit(:title, :tag, :body)
        end
end
