module Item::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      byebug
      step Model(Item, :new)
      step Contract::Build(constant: Item::Contract::Create)
      step :test

      def test(options ,  params)
        byebug
        @test = 'wew'
      end
    end
    byebug
    step Nested(Present)
    step Contract::Validate(key: :item)
    step Contract::Persist()
  end
end
