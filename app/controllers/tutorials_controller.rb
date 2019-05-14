# frozen_string_literal: true

class TutorialsController < ApplicationController
  def show
    tutorial = Tutorial.find(params[:id])
    four_oh_four unless current_user || tutorial.classroom == false
    @facade = TutorialFacade.new(tutorial, params[:video_id])
  end
end
