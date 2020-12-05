# == Schema Information
#
# Table name: prospects
#
#  id         :integer          not null, primary key
#  contact    :string
#  country    :string
#  details    :string
#  round      :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Prospect < ApplicationRecord

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })

  has_one(:admit, { :class_name => "Admit", :foreign_key => "prospect_id" })

end
