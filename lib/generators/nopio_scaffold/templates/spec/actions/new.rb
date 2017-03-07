  describe 'GET #new' do
    it 'assigns a new <%= singular_name %> as @<%= singular_name %>' do
      get :new, params: {}
      expect(assigns(:<%= singular_name %>)).to be_a_new(<%= class_name %>)
      expect(assigns(:<%= singular_name %>).user_id).to eq subject.current_user.id
    end
  end
