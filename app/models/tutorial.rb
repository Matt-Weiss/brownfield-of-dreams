# frozen_string_literal: true

class Tutorial < ApplicationRecord
  has_many :videos, -> { order(position: :ASC) }
  acts_as_taggable_on :tags, :tag_list
  accepts_nested_attributes_for :videos

  def self.limit_to_users(user)
    if user == nil
      where(classroom: false)
    else
      self
    end
  end

end
