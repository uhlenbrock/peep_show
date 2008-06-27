module ActionController
  
  class Base
    
    def peep_show(object, options = {})
      @item = object.to_s.camelize.constantize.find(params[:id])
      params[object].each_pair { |key, value| @item[key] = value } unless params[object].nil?
      return @item
    end
    
  end

end