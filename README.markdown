# PeepShow

A sneaky preview for dirty objects.
View unsaved content in your show view.


## Example

	# Controller
	def show
    	@post = peep_show(:post)
  	end

  	# Form View
  	<%= submit_to_peep_show_('Preview', @post) %>

  	# Show View or Layout (optional)
  	<%= peep_show_flash %>

Copyright (c) 2008 Bobby Uhlenbrock, released under the MIT license