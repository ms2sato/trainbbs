class Comment < ActiveRecord::Base
  has_many :comments, foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Comment', foreign_key: 'parent_id', touch: true
end
