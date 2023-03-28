class BooksController < ApplicationController
before_action :authenticate_user!
def index

    if params[:tag_id].present?
        @books = Tag.find(params[:tag_id]).books.page(params[:page]).per(3)
    elsif params[:search] == nil
        books = Book.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        @books =Kaminari.paginate_array(books).page(params[:page]).per(3)
    elsif params[:search] == ''
        books = Book.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        @books =Kaminari.paginate_array(books).page(params[:page]).per(3)
    else
        @books = Book.where("title LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(3)
    end
    
end



def new
    @book = Book.new
end

def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
        redirect_to :action => "index"
    else
        redirect_to :action => "new"
    end
    end
def show
    @book = Book.find(params[:id])

    end
    
def edit
    @book = Book.find(params[:id])
    end
def update
    book = Book.find(params[:id])
    if book.update(book_params)
        redirect_to :action => "show", :id => book.id
    else
        redirect_to :action => "new"
    end
    end

def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to action: :index
    end

def top
    abc = User.order("title")
end



    private
    def book_params
    params.require(:book).permit(:title, :author, :image, :price, :body, tag_ids: [])
    end

end
