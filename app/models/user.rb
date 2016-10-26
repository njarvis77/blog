# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  handle     :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  rolify #:before_add => :before_add_method
  #def before_add_method(role)
    # do something before it gets added
  #end

  after_create :assign_default_role
  def assign_default_role
    self.add_role(:viewer) if self.roles.blank?
  end

  has_many :comments
  has_many :posts
end
