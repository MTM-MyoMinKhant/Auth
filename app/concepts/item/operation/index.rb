module Item::Operation
  class Index < Trailblazer::Operation
    step :get_all_items

    def get_all_items(options , **)
      options['items'] = Item.all
    end
  end
end
