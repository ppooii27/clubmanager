# == Schema Information
#
# Table name: departments
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Department < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :tasks

  validates :name, presence: true

  scope :by_name, order(:name)

end