class RankingController < ApplicationController
    def have
        @title = 'みんながもっているもの'
        @items = Item.all.sort{|a, b| a.have_users.count <=> b.have_users.count }.take(10)
        render 'show'
    end
    
    def want
        @title = 'みんながほしいもの'
        @items = Item.all.sort{|a, b| a.want_users.count <=> b.want_users.count }.take(10)
        render 'show'
    end
end