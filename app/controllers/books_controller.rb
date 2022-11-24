class BooksController < ApplicationController
  def new
    @book = Book.new
  end

    # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @books = Book.all
    @user = current_user
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to books_path
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
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
    params.require(:book).permit(:title, :body, :profile_image)
  end
end
