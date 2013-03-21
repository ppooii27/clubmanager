class ChecklistItemsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_layout_data

  def complete
    complete_item
  end

  def sidebar_complete
    complete_item
  end

  def undo_complete
    @checklist_item = ChecklistItem.find params[:id]
    @checklist_item.undo_complete
  end

  def show
    @checklist_item = ChecklistItem.find params[:id]
  end

  def edit
    @checklist_item = ChecklistItem.find params[:id]
  end

  def update
    @checklist_item = ChecklistItem.find params[:id]
    if @checklist_item.update_attributes(params[:checklist_item])
      flash[:notice] = 'Checklist item was successfully updated'
      redirect_to @checklist_item
    else
      render 'edit'
    end
  end

  protected

  def complete_item
    @checklist_item = ChecklistItem.find params[:id]
    @checklist_item.complete
  end
end
