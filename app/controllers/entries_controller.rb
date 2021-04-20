class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  private

  def entry_params
    params.require(:entry).permit(:text).merge(user_id: current_user.id, want_id: params[:want_id])
  end
end
