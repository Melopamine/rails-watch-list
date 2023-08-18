class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @reviews = @list.reviews  # Assuming you have a has_many :reviews relationship in your List model
    @review = Review.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def edit_image
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path, notice: 'List image was successfully updated.'
    else
      render :edit_image
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :image, :photo)
  end
end
