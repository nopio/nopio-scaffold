  describe 'GET #index' do
    it 'assigns all <%= plural_name %> as @<%= plural_name %>' do
      <%= singular_name %> = create(:<%= singular_name %>, user_id: subject.current_user.id)
      create(:<%= singular_name %>, user_id: subject.current_user.id + 1)
      get :index, params: {}
      expect(assigns(:<%= plural_name %>)).to eq([<%= singular_name %>])
    end
  end
