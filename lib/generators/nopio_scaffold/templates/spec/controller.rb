require 'rails_helper'

RSpec.describe <%= controller_class_name %>Controller, type: :controller do

  before do
    @user = create(:user)
    sign_in @user
  end

  let(:not_authorized_<%= singular_name  %>) { create(:<%= singular_name %>, user_id: subject.current_user.id + 1) }
<% if field_to_check_update -%>
  let(:valid_attributes) { { <%= field_to_check_update[:name]  %>: <%= field_to_check_update[:old_value]  %> } }
<% else -%>
  let(:valid_attributes) { skip('Add a hash of attributes invalid for your model') }
<% end -%>
  let(:invalid_attributes) { skip('Add a hash of attributes invalid for your model') }

  <%= controller_methods 'spec/actions' %>
end
