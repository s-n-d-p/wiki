class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index 
        @articles = Article.all.order('created_at DESC')
    end

    def new 
        @article = current_user.articles.build
    end 

    def create 
        @article = current_user.articles.build(article_params)
        if @article.save 
            redirect_to @article 
        else 
            render 'new'
        end
    end 

    def show 
        @article = Article.find(params[:id])
    end

    private 
        def article_params 
            params.require(:article).permit(:title, :body)
        end
end
