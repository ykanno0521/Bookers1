class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
  		redirect_to book_path(@book.id), notice:'Book was successfully created.'
		else
			@books = Book.all
			render 'index'
		end
  	# if 保存する
  	# 	redirect_to showページ
  	# else
  	# 	render index画面に直接遷移
  	# end
  end


  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book.id), notice:'Book was successfully created.'
  	else
      render :show
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  private
	def book_params
		 params.require(:book).permit(:title, :body)
	end
end
