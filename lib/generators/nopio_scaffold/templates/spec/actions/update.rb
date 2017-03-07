  describe 'PUT #update' do
    context 'with valid params' do
<% if field_to_check_update -%>
      let(:new_attributes) { { <%= field_to_check_update[:name]  %>: <%= field_to_check_update[:new_value]  %> } }
<% else -%>
      let(:new_attributes) { skip('Add a hash of new attributes valid for your model') }
<% end -%>

      it 'updates the requested <%= singular_name %>' do
        <%= singular_name %> = create(:<%= singular_name %>, user_id: subject.current_user.id)
        put :update, params: { id: <%= singular_name %>.to_param, <%= singular_name %>: new_attributes }
        <%= singular_name %>.reload
<% if field_to_check_update -%>
        expect(assigns(:<%= singular_name %>).<%= field_to_check_update[:name] %>).to eq(<%= field_to_check_update[:new_value] %>)
<% else -%>
        skip('Check if your field changed')
<% end -%>
      end

      it 'assigns the requested <%= singular_name %> as @<%= singular_name %>' do
        <%= singular_name %> = create(:<%= singular_name %>, user_id: subject.current_user.id)
        put :update, params: { id: <%= singular_name %>.to_param, <%= singular_name %>: valid_attributes }
        expect(assigns(:<%= singular_name %>)).to eq(<%= singular_name %>)
      end

      it 'redirects to the <%= singular_name %>' do
        <%= singular_name %> = create(:<%= singular_name %>, user_id: subject.current_user.id)
        put :update, params: { id: <%= singular_name %>.to_param, <%= singular_name %>: valid_attributes }
<% if show_action? -%>
        expect(response).to redirect_to(<%= singular_name %>)
<% else -%>
        expect(response).to redirect_to(<%= plural_name %>_path)
<% end -%>
      end

      it 'not accepts attempt to access other user\'s <%= singular_name %>' do
        put :update, params: { id: not_authorized_<%= singular_name %>.to_param, <%= singular_name %>: new_attributes }
        expect(response).to redirect_to(root_path)
<% if field_to_check_update -%>
        expect(assigns(:<%= singular_name %>).<%= field_to_check_update[:name] %>).not_to eq(<%= field_to_check_update[:new_value] %>)
<% else -%>
        skip('Check if your field changed')
<% end -%>
      end
    end

    context 'with invalid params' do
      it 'assigns the <%= singular_name %> as @<%= singular_name %>' do
        <%= singular_name %> = create(:<%= singular_name %>, user_id: subject.current_user.id)
        put :update, params: { id: <%= singular_name %>.to_param, <%= singular_name %>: invalid_attributes }
        expect(assigns(:<%= singular_name %>)).to eq(<%= singular_name %>)
      end

      it 're-renders the "edit" template' do
        <%= singular_name %> = create(:<%= singular_name %>, user_id: subject.current_user.id)
        put :update, params: { id: <%= singular_name %>.to_param, <%= singular_name %>: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end
