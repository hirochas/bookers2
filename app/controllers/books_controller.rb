class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
    # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all 
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  
   # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :caption, :profile_image)
  end
end
