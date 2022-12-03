class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]


    # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @books = Book.all
    @user = current_user
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      redirect_to books_path
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user

  end

  def show
    @books = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

   # 投稿データのストロングパラメータ
  private
  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to books_path
    end
 end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
