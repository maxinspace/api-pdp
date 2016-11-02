class Todo < ActiveRecord::Base
  belongs_to :user, dependent: :destroy

  validates :name, presence: true
end
