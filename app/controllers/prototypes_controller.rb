class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :delete]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  #この記述により、ログインしていないユーザーをログインページの画面に促すことができます。

  def index
    #モデル名.includes(:紐付くモデル名)
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end
 
  def create
    @prototype =Prototype.new(proto_params)
    # binding.pry
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    render :edit
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(proto_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
   if @prototype.destroy
      redirect_to root_path
   else
      redirect_to root_path
   end
  end

  private

  def proto_params
    params.require(:prototype).permit(:title, :image, :concept, :catch_copy).merge(user_id: current_user.id)
  end


  def move_to_index
    @prototype = Prototype.find(params[:id])
    unless @prototype.user == current_user
      redirect_to action: :index
    end
  end
  #ログイン状態のユーザーであっても、他のユーザーのプロトタイプ編集ページのURLを直接入力して遷移しようとすると、トップページにリダイレクトされること


end

