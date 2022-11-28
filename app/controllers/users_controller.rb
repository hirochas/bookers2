class UsersController < ApplicationController
  def new
    @book = Book.new
  end


    def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
     if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to books_path
     else
      render :new
     end
    end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books


  end

  def edit
    @user = current_user
    @book = Book.new(book_params)
    @books = Book.all
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end