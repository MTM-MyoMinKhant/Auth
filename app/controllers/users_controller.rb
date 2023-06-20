class UsersController < ApplicationController
    def index
        @user = current_user
        if @user.role == 0
            redirect_to controller: :admin, action: :index 
        end  
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @track = current_user.role
        if @user.update(user_params) && @track == 0
            redirect_to admin_index_path
        elsif @user.update(user_params) && @track == 1
            redirect_to users_path
        else
            render :edit, status: :unprocessable_entity
        end  
    end

    private
    def user_params
        params.require(:user).permit(:name , :age)
    end
end
