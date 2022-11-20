class UsersController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end  
  
  def show 
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user.id) 
  end  

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)  
  end
end