class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :user_id, type: Integer
  field :acct_num, type: Integer
  field :password_digest, type: String
  field :email, type: String
  field :nm_first, type: String
  field :nm_last, type: String

  has_secure_password
end
