class RegistrationsController < Devise::RegistrationsController



  def create
    user = User.new(sign_up_params)
    if user.save
      redirect_to user_path(user.id), :flash => { :notice => "User signed up!" }
    else
      flash.keep
      redirect_to new_registration_path('user'), :flash => { :error => "Couldn't sign up a new user. Please try again" }
    end
  end
  private
  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :admin)
  end
end