  def update
    if @<%= singular_name %>.update(<%= singular_name %>_params)
<% if show_action? -%>
      redirect_to @<%= singular_name %>, notice: '<%= human_name %> was successfully updated.'
<% else -%>
      redirect_to <%= plural_name %>_url, notice: '<%= human_name %> was successfully updated.'
<% end -%>
    else
      render :edit
    end
  end
