  describe 'GET #edit' do
    it 'assigns the requested <%= singular_name %> as @<%= singular_name %>' do
      <%= singular_name %> = create(:<%= singular_name %>, user_id: subject.current_user.id)
      get :edit, params: { id: <%= singular_name %>.to_param }
      expect(assigns(:<%= singular_name %>)).to eq(<%= singular_name %>)
    end

    it 'not accepts attempt to access other user\'s <%= singular_name %>' do
      get :edit, params: { id: not_authorized_<%= singular_name %>.to_param }
      expect(response).to redirect_to(root_path)
    end
  end
