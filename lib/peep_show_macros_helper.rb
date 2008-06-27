module PeepShowMacrosHelper
  
  def submit_to_peep_show(name, object, options = {})
    options[:form_id] ||= dom_id(object, :edit)
    options[:url] ||= %{/#{params[:controller]}/show/#{object.id}}
    options[:popup] ||= true
    function =  %{var action=$("#{options[:form_id]}").readAttribute("action");}
    function << %{$("#{options[:form_id]}").writeAttribute("target","_blank");} if options[:popup]
    function << %{$("#{options[:form_id]}").writeAttribute("action","#{options[:url]}");}
    function << %{$("#{options[:form_id]}").submit();}
    function << %{alert("enjoy the preview");}
    function << %{$("#{options[:form_id]}").writeAttribute("target","_self");} if options[:popup]
    function << %{$("#{options[:form_id]}").writeAttribute("action",action);}
    link_to_function(name, function)
  end
  
end