module PaymentAuthenticatable
  extend ActiveSupport::Concern

  included do
    attr_reader :password
    attr_accessor :password_confirmation
  end

  def self.required_fields(klass)
    [ :encrypted_password ]
  end

  # Generates password encryption based on the given value.
  def password=(new_password)
    @password = new_password
    self.encrypted_password = password_digest(@password) if @password.present?
  end

  # Verifies whether an password (ie from sign in) is the user password.
  def valid_password?(password)
    return false if encrypted_password.blank?
    bcrypt   = ::BCrypt::Password.new(encrypted_password)
    password = ::BCrypt::Engine.hash_secret("#{password}#{self.class.pepper}", bcrypt.salt)
    Devise.secure_compare(password, encrypted_password)
  end

  # Set password and password confirmation to nil
  def clean_up_passwords
    self.password = self.password_confirmation = nil
  end

  # Update record attributes when :current_password matches, otherwise returns
  # error on :current_password. It also automatically rejects :password and
  # :password_confirmation if they are blank.
  def update_with_password(params, *options)
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if valid_password?(current_password)
      update_attributes(params, *options)
    else
      self.assign_attributes(params, *options)
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end

    clean_up_passwords
    result
  end

  # A reliable way to expose the salt regardless of the implementation.
  def authenticatable_salt
    encrypted_password[0,29] if encrypted_password
  end

protected

  # Digests the password using bcrypt. Custom encryption should override
  # this method to apply their own algorithm.
  #
  # See https://github.com/plataformatec/devise-encryptable for examples
  # of other encryption engines.
  def password_digest(password)
    Devise.bcrypt(self.class, password)
  end

  # module ClassMethods
  #   Devise::Models.config(self, :pepper, :stretches)

  #   # We assume this method already gets the sanitized values from the
  #   # DatabaseAuthenticatable strategy. If you are using this method on
  #   # your own, be sure to sanitize the conditions hash to only include
  #   # the proper fields.
  #   def find_for_database_authentication(conditions)
  #     find_for_authentication(conditions)
  #   end
  # end
end