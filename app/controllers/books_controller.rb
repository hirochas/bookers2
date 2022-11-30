class BooksController < ApplicationController


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
    @books = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end



  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id)
    end
    render :edit
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

   # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
