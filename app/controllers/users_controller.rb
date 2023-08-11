class UsersController < ApplicationController
    def index
        @user = current_user
        if @user.role == 0
            redirect_to admin_index_path
        end  
    end

    def edit
        # @user = User.find(params[:id])
        @user = current_user
        run User::Operation::Update::Present 
    end

    def update
        @result = run User::Operation::Update
        @track = current_user.role

        if @result.success?
            if @track == 0
                redirect_to admin_index_path
            else
                redirect_to users_path
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit(:name , :age)
    end
end
