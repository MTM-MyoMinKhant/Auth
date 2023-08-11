module User::Operation
  class Index < Trailblazer::Operation
    step :get_all_items
    step :validate_the_data , fail_fast: true
    fail :add_errors
    step :create_user

    def get_all_items(options, params)
      options['users'] = User.where(role: 1)
    end

    def validate_the_data(options , params )
      params[:blogpost][:email].present? &&  params[:blogpost][:name].present?
    end

    def add_errors(options , params)
      @test = 'wew'
    end

    def create_user(options , params)
      # options[:users] = User.new(params[:blogpost])
      # options[:users].save
      @test = 'wew'
    end
  end
end
