class BooksController < ApplicationController

  def index
    @books = Book.all
    @new_book = Book.new
  end

  def create
    @books = Book.all
    @new_book = Book.new(book_params)
    @book = @new_book
    if @book.save
      flash[:successfully] = "Created"
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @create = false
    @update = false
  end

  def edit
    @editing_book = Book.find(params[:id])
  end

  def update
    @editing_book = Book.find(params[:id])
    edited_book = @editing_book
    @book = edited_book
    if edited_book.update(book_params)
      flash[:successfully] = "Updated"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def top
  end

  def destroy
    removed_book = Book.find(params[:id])
    removed_book.destroy
    redirect_to books_path()
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
