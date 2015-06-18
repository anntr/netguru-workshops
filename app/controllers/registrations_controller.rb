class RegistrationsController < Devise::RegistrationsController



  def create
    user = User.new(sign_up_params)
    if user.save
      puts "no kurwaaaaaa"
    end
  end
  private
  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :admin)
  end
end