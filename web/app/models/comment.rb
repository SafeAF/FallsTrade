class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  broadcasts_to ->(comment) {'comments'}
end
