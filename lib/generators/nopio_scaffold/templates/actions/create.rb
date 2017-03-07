  def create
    if @<%= singular_name %>.save
<% if show_action? -%>
      redirect_to @<%= singular_name %>, notice: '<%= human_name %> was successfully created.'
<% else -%>
      redirect_to <%= plural_name %>_url, notice: '<%= human_name %> was successfully created.'
<% end -%>
    else
      render :new
    end
  end
