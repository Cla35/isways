class UsersController < ApplicationController

  def index
    @users = User.all
  end


  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
     if @user.save
       flash[:Successfully] = "A sua conta foi criado"
       session[:user_id] = @user.id
       redirect_to saidas_path

     else
       render 'new'
     end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:Successfully] = "O seu Perfil foi alterado com Sucesso"
     redirect_to saidas_path
   else
     render 'edit'
   end
  end

  def show
    @user = User.find(params[:id])
  end

  # DELETE /pontos/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
    format.html { redirect_to users_url, notice: 'Article was successfully destroyed.' }
    format.json { head :no_content }
    end
  end

  private

   def user_params
     params.require(:user).permit(:name, :password, :admin)
   end

end
