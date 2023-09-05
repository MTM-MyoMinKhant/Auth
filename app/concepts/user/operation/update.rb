module User::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User , :find_by)
      step :test
      step Contract::Build(constant: User::Contract::Update)

      def test(options , params)
        byebug
        @test = 'wew'
      end
    step Nested(Present)
    step Contract::Validate(key: :user)
    step Contract::Persist()
  end
end
