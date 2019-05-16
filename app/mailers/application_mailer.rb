# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@serene-gorge-80745.herokuapp.com'
  layout 'mailer'
end
