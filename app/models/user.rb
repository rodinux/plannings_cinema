class User < ApplicationRecord
  authenticates_with_sorcery!

   before_create :setup_default_role_for_new_users

  ROLES = %w[guest manager admin]

  validates :password, length: { minimum: 5 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }
  validates :email, uniqueness: true

 def self.users_alphabet
     users_alphabet = User.order(prenom: :asc)
 end

 private

   def setup_default_role_for_new_users
     if self.role.blank?
       self.role = "guest"
     end
   end
end
