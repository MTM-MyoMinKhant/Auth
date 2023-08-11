class AdminController < ApplicationController
    def index     
        @result = User::Operation::Index.wtf?(user: current_user, blogpost: { email: "user5@gmail.com", password: "1234qwer" , name: "user5" , age: "22" , role: 1 })

        if @result.success?
            @user = @result[:user]
            @customers = @result[:users]
        end

        if @user.role == 1
            redirect_to root_path
        end
    end

    def show
        @user = current_user
    end

    def edit
        @user = current_user
        run User::Operation::Update::Present
        byebug
        @test = 'wew'
        # @user = User.find(params[:id])
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

    def destroy
        run User::Operation::Delete
        redirect_to admin_index_path
        # @user = User.find(params[:id])
        # @user.destroy
        
    end
end
