class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end
        
  def new
    @list = List.new
  end
        
  def show
    @bookmark = Bookmark.new
    # @review = Review.new(list: @list)
  end
        
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: 'List was successfully created'
    else
      render :new
    end
  end
        
  def edit; end
        
  def update
    @list.update(list_params)
    redirect_to list_path(@list)
  end
        
  def destroy
    @list.destroy
    redirect_to lists_path
  end
        
  private
        
  def list_params
    params.require(:list).permit(:name)
  end
  
  def find_list
    @list = List.find(params[:id])
  end
end
