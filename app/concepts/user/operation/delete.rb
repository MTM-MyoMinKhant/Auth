module User::Operation
  class Delete < Trailblazer::Operation
    step Model(User, :find_by)
    step :delete

    def delete(options , model: , **)
      model.destroy
    end
  end
end
