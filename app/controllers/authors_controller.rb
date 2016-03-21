class AuthorsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :find_author, only: [:show, :edit, :update, :delete]

  def index
    @authors = Author.all
  end

  def show
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Successfully Created Author"
      redirect_to author_path(@author)
    else
      flash.now[:error] = "There was an error creating the author"
      render :new
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      redirect_to author_path(@author), notice: "Successfully Updated"
    else
      flash.now[:error] = "Error updating author"
      render :edit
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path, notice: "Successfully Deleted Author"
  end

  private

    def find_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:first_name, :last_name)
    end
end
