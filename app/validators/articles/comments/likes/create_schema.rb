module Articles
  module Comments
    module Likes
      CreateSchema = Dry::Validation.Schema(BaseSchema) do
        configure do
          config.namespace = :likes
          option :comment

          def time_and_count_restraint?(likes_count_per_hour)
            comment.likes.desc_ordered.time_restraint.count < likes_count_per_hour
          end
        end

        required(:likes_count_per_hour).filled(:time_and_count_restraint?)
      end
    end
  end
end
