  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new <%= class_name %> with current user\'s id' do
        expect {
          post :create, params: { <%= singular_name %>: valid_attributes }
        }.to change(<%= class_name %>, :count).by(1)

        expect(<%= class_name %>.last.user_id).to eq subject.current_user.id
      end

      it 'assigns a newly created <%= singular_name %> as @<%= singular_name %>' do
        post :create, params: { <%= singular_name %>: valid_attributes }
        expect(assigns(:<%= singular_name %>)).to be_a(<%= class_name %>)
        expect(assigns(:<%= singular_name %>)).to be_persisted
      end

      it 'redirects to the created <%= singular_name %>' do
        post :create, params: { <%= singular_name %>: valid_attributes }
<% if show_action? -%>
        expect(response).to redirect_to(assigns(:<%= singular_name %>))
<% else -%>
        expect(response).to redirect_to(<%= plural_name %>_path)
<% end -%>
      end

      it 'not accepts attempt to access other user\'s <%= singular_name %>' do
        post :create, params: { <%= singular_name %>: valid_attributes.merge(user_id: not_authorized_<%= singular_name %>.user_id) }
        expect(assigns(:<%= singular_name %>).user_id).to eq subject.current_user.id
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved <%= singular_name %> as @<%= singular_name %>' do
        post :create, params: { <%= singular_name %>: invalid_attributes }
        expect(assigns(:<%= singular_name %>)).to be_a_new(<%= class_name %>)
      end

      it 're-renders the "new" template' do
        post :create, params: { <%= singular_name %>: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end
