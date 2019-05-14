# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :first_name
  enum role: %i[default admin]
  has_secure_password

  def bookmarked_videos
    videos.select('videos.*, tutorials.title as tutorial_name')
          .joins(:tutorial)
          .order(:tutorial_id, :position)
  end
end
