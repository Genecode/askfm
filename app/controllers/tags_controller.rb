class TagsController < ApplicationController
  #layout :application
  before_action :load_tag, only:  [:destroy, :show]
  def index
  end

  def show
    @questions = @tag.questions
  end

  def destroy
    #TODO

  end


  private

  def load_tag
    @tag ||= Tag.find params[:id]
  end

end
