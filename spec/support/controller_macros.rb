module ControllerMacros
  def login(uname)
    before(:each) do
      sign_in users(uname)
    end
  end
end