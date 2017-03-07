class <%= controller_class_name %>Controller < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
  end
<% if show_action? -%>

  def show
  end
<% end -%>

  def new
  end

  def create
    if @<%= singular_name %>.save
      redirect_to @<%= singular_name %>, notice: '<%= class_name.underscore.humanize %> was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @<%= singular_name %>.update(<%= singular_name %>_params)
      redirect_to @<%= singular_name %>, notice: '<%= class_name.underscore.humanize %> was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @<%= singular_name %>.destroy
    redirect_to <%= plural_name %>_url, notice: '<%= class_name.underscore.humanize %> was successfully destroyed.'
  end

  private

  def <%= singular_name %>_params
    params.require(:<%= singular_name %>).permit(<%= editable_attributes.map { |a| a.name.dup.prepend(':') }.join(', ') %>)
  end
end
