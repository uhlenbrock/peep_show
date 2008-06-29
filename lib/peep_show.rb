module ActionController
  
  class Base
    
    # Example:
    #
    #   # Controller
    #   def show
    #     @post = peep_show(:post)
    #   end
    #
    def peep_show(object, options = {})
      @item = object.to_s.camelize.constantize.find(params[:id])
      params[object].each_pair { |key, value| @item[key] = value } unless params[object].nil?
      return @item
    end
    
  end

end