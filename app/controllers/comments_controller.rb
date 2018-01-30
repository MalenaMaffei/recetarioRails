class CommentsController < ApplicationController

    before_action :confirm_permissions, :only => [:destroy]

    def create
        # @recipe = Recipe.find(params[:post_id])
        # @comment = @recipe.comments.create(comment_params)
        #
        # flash_redirect('Comment Added', post_path(@post))


        @recipe = Recipe.find(params[:recipe_id])
        @comment = @recipe.comments.build(comment_params)
        @comment.user_id = current_user.id
        @comment.save!
        # valid_record?(@comment, "Comentario posteado exitosamente.", post_path(@post), '')
        flash_redirect('Comment Added', recipe_path(@recipe))
    end

    def destroy
      @comment = Comment.find(params[:recipe_id])
      @comment.destroy
      flash_redirect("Comentario eliminado.", request.referrer)
    end


    private
    def comment_params
      params.require(:comment).permit(:body, :recipe_id, :user_id)
    end

    def confirm_permissions
      comment = Comment.find(params[:recipe_id])
      unless helpers.allowed?(comment.user)
        flash_redirect("No tenes permisos para realizar esa accion.", request.referrer)
      end
    end
end
