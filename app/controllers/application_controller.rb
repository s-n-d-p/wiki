class ApplicationController < ActionController::Base
    before_action :getTags
    def getTags
        @tags = Tag.all
    end 
end
