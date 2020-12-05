# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  ask_me_about    :text
#  name            :string
#  country         :string
#  email           :string
#  password_digest :string
#  prospects_count :integer          default(0)
#  year            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:prospects, { :class_name => "Prospect", :foreign_key => "user_id", :dependent => :destroy })
  
  has_many(:comments, { :class_name => "Comment", :foreign_key => "user_id", :dependent => :destroy })



end
