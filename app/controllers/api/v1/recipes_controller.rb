module Api
  module V1
    class RecipesController < ApplicationController
      def create
        @recipe = Recipe.new(post_params)

        if @recipe.valid?
          if params[:recipe][:image]
            blob = ActiveStorage::Blob.create_and_upload!(
              io: StringIO.new(decode(params[:recipe][:image][:data]) + "\n"),
              filename: params[:recipe][:image][:name],
            )
            @recipe.image.attach(blob)
          end
          # binding.pry
          @recipe.save
          render json: {
                  status: :created,
                  recipe: @recipe,
                  methods: [:image_url],
                }
        else
          render json: {
            status: 422,
            errors: @recipe.errors.full_messages,
          }
        end
      end

      def index
        @recipes = Recipe.order(created_at: :desc)
        render json: @recipes,
          methods: [:image_url]
      end

      def update
        @recipe = Recipe.find(params[:id])
        if @recipe.valid?
          if params[:recipe][:image]
            blob = ActiveStorage::Blob.create_and_upload!(
              io: StringIO.new(decode(params[:recipe][:image][:data]) + "\n"),
              filename: params[:recipe][:image][:name],
            )
            @recipe.image.attach(blob)
          end
          @recipe.update(post_params)
          render json: {
            status: :updated,
            recipe: @recipe
          },methods: [:image_url]
        else
          render json: {
            status: 500,
            errors: @recipe.errors.full_messages,
          }
        end
      end

      private

      def post_params
        params.require(:recipe).permit(
          :user_id, :title, :time_required, :food, :process, image: []
        )
      end

      def decode(str)
        Base64.decode64(str.split(",").last)
      end
    end
  end
end
