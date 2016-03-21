class TagsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :find_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Successfully Created Tag"
      redirect_to tag_path(@tag)
    else
      flash.now[:error] = "There was an error creating the tag"
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to tag_path(@tag), notice: "Successfully Updated"
    else
      flash.now[:error] = "Error updating tag"
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path, notice: "Successfully Deleted Tag"
  end

  private

    def find_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
end
