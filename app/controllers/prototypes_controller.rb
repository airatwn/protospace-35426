class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :delete]
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
      redirect_to root_path
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

  def contributor_confirmation
    redirect_to root_path unless current_user == @prototype.user
  end


end

