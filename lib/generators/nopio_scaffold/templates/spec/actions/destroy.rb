  describe 'DELETE #destroy' do
    it 'destroys the requested <%= singular_name %>' do
      <%= singular_name %> = create(:<%= singular_name %>, user_id: subject.current_user.id)
      expect {
        delete :destroy, params: { id: <%= singular_name %>.to_param }
      }.to change(<%= class_name %>, :count).by(-1)
    end

    it 'redirects to the <%= plural_name %> list' do
      <%= singular_name %> = create(:<%= singular_name %>, user_id: subject.current_user.id)
      delete :destroy, params: { id: <%= singular_name %>.to_param }
      expect(response).to redirect_to(<%= plural_name %>_url)
    end

    it 'not accepts attempt to access other user\'s <%= singular_name %>' do
      not_authorized_<%= singular_name %>

      expect {
        delete :destroy, params: { id: not_authorized_<%= singular_name %>.to_param }
      }.to change(<%= class_name %>, :count).by(0)
      expect(response).to redirect_to(root_path)
    end
  end
