module ApplicationHelper

    # ADMIN = 'male'

    def error_messages_for(object)
      render(:partial => 'partials/error_messages', :locals => {:object => object})
    end

    def current_user
        User.find(session[:user_id]) if session[:user_id]
    end

    def get_ingredients(recipe)
        if recipe.ingredients
            recipe.ingredients.join(', ')
        else
            ''
        end
    end

    def allowed?(owner)
      if owner == current_user || current_user.admin
        true
      else
        false
      end
    end
end
