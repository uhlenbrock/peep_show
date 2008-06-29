module PeepShowMacrosHelper
  
  # Makes an HTML link which will (optionally) pop a new window and render 
  # the dirty object for review.
  #
  # On click, the current form data will be passed to the show action of
  # the current controller and merged with associations to render a preview.
  # 
  # <tt>name</tt>::               The link text (eg, Preview)
  # <tt>object</tt>::             A reference to the current content (eg, f.object or @post)
  #
  # Addtional +options+ are:
  # <tt>:form_id</tt>::           For use when the rails standard form id (eg, edit_post_1) is not in use
  # <tt>:url</tt>::               An alternate URL to render the dirty preview (default is /posts/show/1)
  # <tt>:popup</tt>::             Setting to false will show the preview in the same window
  def submit_to_peep_show(name, object, options = {})
    options[:form_id] ||= dom_id(object, :edit)
    options[:url] ||= %{/#{params[:controller]}/show/#{object.id}}
    options[:popup] ||= true
    function =  %{var action=$("#{options[:form_id]}").readAttribute("action");}
    function << %{$("#{options[:form_id]}").writeAttribute("target","_blank");} if options[:popup]
    function << %{$("#{options[:form_id]}").writeAttribute("action","#{options[:url]}");}
    function << %{$("#{options[:form_id]}").submit();}
    function << %{$("#{options[:form_id]}").writeAttribute("target","_self");} if options[:popup]
    function << %{$("#{options[:form_id]}").writeAttribute("action",action);}
    link_to_function(name, function)
  end
  
end