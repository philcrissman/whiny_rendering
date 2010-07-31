module WhinyRendering
  
  def whiny_rendering(format=:div)
    unless @_memoized__pick_partial_template.nil?  
      partials = @_memoized__pick_partial_template.map do |p|
        p[1].instance_variable_get(:"@_memoized_path")
      end
    else
      partials = []
    end

    output = case format
      when :div
        build_div_output(partials)
      when :hidden
        build_hidden_prototype_output(partials)
      when :hidden_prototype
        build_hidden_prototype_output(partials)
      when :hidden_jquery
        build_hidden_jquery_output(partials)
      when :comment
        build_comment_output(partials)
    end
  end

  private
  def build_div_output(partials, hidden = false)
    div = <<-EOD
    <div id='whiny_rendering' #{"style='display:none;'" if hidden} >
      Controller <strong>#{ @controller.controller_name}</strong> and action <strong>#{ @controller.action_name }</strong>
      rendering template <strong>#{ @_first_render.instance_variable_get(:"@_memoized_path") }</strong>.
      #{ "Rendering partials: <strong>" + partials.join(', ') + "</strong>" unless partials.empty? }
    </div>
    EOD
  end

  def build_comment_output(partials)
    comment = <<-EOD
      <!--
      Controller: #{ @controller.controller_name}
      Action: #{ @controller.action_name}
      Template: #{ @_first_render.instance_variable_get(:"@_memoized_path")}
      #{ partials.empty? ? "-->" : "Partials: " + partials.join(', ') + "\n-->" }
    EOD
  end

  def build_hidden_jquery_output(partials)
    output = "<a href='#' id='whiny_rendering_toggle' style='font-size:0.8em;'>Whiny Rendering</a>\n"
    output << build_div_output(partials, true)
    output << <<-EOD
      <script type="text/javascript">
        jQuery('#whiny_rendering_toggle').toggle(
          function () {
            jQuery('#whiny_rendering').show();
          },
          function () {
            jQuery('#whiny_rendering').hide();
          }
        );
      </script>
    EOD
  end
  
  def build_hidden_prototype_output(partials)
     output = "<a href='javascript:$('whiny_rendering').toggle();' id='whiny_rendering_toggle' style='font-size:0.8em;'>Whiny Rendering</a>\n"
     output << build_div_output(partials, true)
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
