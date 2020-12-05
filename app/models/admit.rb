# == Schema Information
#
# Table name: admits
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  prospect_id :integer
#
class Admit < ApplicationRecord
  
  belongs_to(:prospect, { :required => true, :class_name => "Prospect", :foreign_key => "prospect_id" })

end
