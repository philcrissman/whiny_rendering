module WhinyRendering
  
  def whiny_rendering(format=:div)
    unless @_memoized__pick_partial_template.nil?  
      partials = @_memoized__pick_partial_template.map do |p|
        p[1].instance_variable_get(:"@_memoized_path")
      end
    else
      partials = []
    end
    if :div == format
       output = <<-EOD
        <div id='whiny_rendering'>
         Controller <strong>#{ @controller.controller_name}</strong> and action <strong>#{ @controller.action_name }</strong> 
         rendering template <strong>#{ @_first_render.instance_variable_get(:"@_memoized_path")}</strong>.
         #{ "Rendering partials: <strong>" + partials.join(', ') + "</strong>" unless partials.empty? }
         </div>
      EOD
    elsif :comment == format
       output = <<-EOD
           <!--
           Controller: #{ @controller.controller_name}
           Action: #{ @controller.action_name}
           Template: #{ @_first_render.instance_variable_get(:"@_memoized_path")}
           #{ partials.empty? ? "-->" : "Partials: " + partials.join(', ') + "\n-->" }
        EOD
    end
  end
  
end



# Controller <strong><%= @controller.controller_name %></strong>
# and action <strong><%= @controller.action_name %></strong>
# rendering template: <strong><%= @_first_render.instance_variable_get(:"@_memoized_path") %></strong>
# <% unless @_memoized__pick_partial_template.nil? %>
#   <br />Rendering partials: 
#   <% @_memoized__pick_partial_template.each do |p| %>
#     <%# skip the rendering/rendering partial in the list. %>
#     <% next if p[1].instance_variable_get(:"@_memoized_path")[0].match(/rendering\/_rendering/) %>
#     | <strong><%= p[1].instance_variable_get(:"@_memoized_path") %></strong>
#     
#   <% end %>
# <% else %>
#   nil
# <% end %>
