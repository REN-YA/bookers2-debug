class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    @book_comment = BookComment.new
    if @comment.save
     render 'book_comment/create'
    else
     @book_comment = comment
      @books = Book.find(params[:book_id])
      @book = Book.new
      @user = @books.user
     render :'books/show'
    end
  end


  def destroy
    @books = Book.find(params[:book_id])
    BookComment.find_by(id: params[:id]).destroy
    render 'book_comment/destroy'
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
