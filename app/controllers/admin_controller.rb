class AdminController < ApplicationController
    def index
        @customers = User.where(role: 1)  
        @user = current_user  
        if @user.role == 1
            redirect_to controller: :users, action: :action_name 
        end  
    end

    def show
        @user = current_user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_index_path
    end
end
