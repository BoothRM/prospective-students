# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  prospect_id :integer
#  user_id     :integer
#
class Comment < ApplicationRecord
  
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:prospect, { :required => true, :class_name => "Prospect", :foreign_key => "prospect_id" })

  validates(:body, { :presence => true })

end
