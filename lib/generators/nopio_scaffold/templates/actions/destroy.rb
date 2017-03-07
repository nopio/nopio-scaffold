  def destroy
    @<%= singular_name %>.destroy
    redirect_to <%= plural_name %>_url, notice: '<%= human_name %> was successfully destroyed.'
  end
