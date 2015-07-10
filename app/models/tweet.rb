class Tweet < ActiveRecord::Base
  validates :text, length: {minimum: 1, maximum: 140}, presence: true
  belongs_to :user
end
