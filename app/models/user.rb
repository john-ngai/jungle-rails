class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    # Find by email after changing to all characters to lowercase & removing any whitespace.
    @user = User.find_by(email: email.downcase.strip)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
