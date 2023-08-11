module User::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      byebug
      step Model(User , :find_by)
      step Contract::Build(constant: User::Contract::Update)
      step :test

      def test(options , params)
        byebug
        @test = 'wew'
      end
    end
    step Nested(Present)
    step Contract::Validate(key: :user)
    step Contract::Persist()
  end
end
