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
      unless params[object].nil?
        params[object].each_pair { |key, value| @item[key] = value }
        @show_peep_show_flash = true
      end
      return @item
    end
    
  end

end