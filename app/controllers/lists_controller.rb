class ListsController < ApplicationController

 def index
  @lists = List.all
 end

 def create
   @lists = List.new(list_params)
    if list.save
      redirect_to list_path(@list)
    else
      render :new
    end
 end
def new
    @lists = List.new
 end

 def edit
    @list = List.find(params[:id])
 end

 def show
    @list = List.find(params[:id])
 end

 def update
    @list = List.find(params[:id])
    @list.update(params[:list])
   redirect_to list_path(@list)
 end

 def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
