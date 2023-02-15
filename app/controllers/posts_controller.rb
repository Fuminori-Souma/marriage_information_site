class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_q, only: [:index, :search]

  def index
    @q = Post.ransack(params[:q])
    # @posts = @q.result.includes(:post, :whatsaid).order(created_at: :desc)
    @posts = @q.result.order(created_at: :desc)
    
    # @posts = Post.all.order(created_at: :desc)

    # binding.pry
    
    # Excelに出力したいデータをインスタンス変数に格納する
    @excels = Post.all
    # 以下、追記
    respond_to do |format|
      format.html
      format.xlsx do
        # ファイル名をここで指定する（動的にファイル名を変更できる）
        response.headers['Content-Disposition'] = "attachment; filename=#{Date.today}.xlsx"
      end
    end

  end

  def show
    # @post = Post.find_by(id: params[:id])
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    # @post = Post.new(content:params[:content])
    # @post = Post.new(place:params[:place], whatsaidparams[:whatsaid])
    @post = Post.new(budget:params[:budget], place:params[:place], time:params[:time], present:params[:present], season:params[:season], whatsaid:params[:whatsaid], comment:params[:comment])
    
    if @post.save
      flash[:notice] = "新たなメッセージを投稿しました"
      redirect_to('/posts/index')
    else
    end
  end

  def new
    @posts = Post.all.order(created_at: :desc)
  end

  def update
    @post = Post.find(params[:id])
    @post.content = params[:content]

    if @post.save
      flash[:notice] = "新たなメッセージを投稿しました"
      redirect_to('/posts/index')
    else
    end
  end

  def destroy
    # # @post = Post.find(params[:id])
    # @post = Post.find_by(id: params[:id])
    # @post.destroy
    # redirect_to('/posts/index')
    
    # if flash[:alert] = "本当に削除してもよろしいですか？"
      @post = Post.find_by(id: params[:id])
      @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/posts/index")
    # end
    
    # flash[:notice] = "これで「満足」だろーがよ…"
    # flash[:alert] = "「俺は」嫌だね…"
  end

  def search
    @results = @q.result
    # binding.pry
  end

  private

  def set_q
    @q = Post.ransack(params[:q])
    # binding.pry
  end

  def set_post
    @post = Post.find(params[:id])
  end

  #   def post_params
  #     params.require(:post).permit(:title, :details, label_ids: [] )
  #   end
end
