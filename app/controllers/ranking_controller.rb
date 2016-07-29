class RankingController < ApplicationController
    def have
        @title = 'みんながもっているもの'
        item_ids = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id').keys
        @items = Item.find(item_ids).sort_by{|o| item_ids.index(o.id)}
        render 'show'
    end
    
    def want
        @title = 'みんながほしいもの'
        item_ids = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id').keys
        @items = Item.find(item_ids).sort_by{|o| item_ids.index(o.id)}
        render 'show'
    end
end

# @ranking = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
# item_ids = @ranking.keys
# @items = Item.find(item_ids).sort_by{|o| item_ids.index(o.id)}
