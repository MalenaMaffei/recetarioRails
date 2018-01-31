module ApplicationHelper

    # ADMIN = 'male'

    def error_messages_for(object)
      render(:partial => 'partials/error_messages', :locals => {:object => object})
    end

    def current_username
        User.find(session[:user_id]).username if session[:user_id]
    end

    def get_ingredients(recipe)
        if recipe.ingredients
            recipe.ingredients.join(', ')
        else
            ''
        end
    end

    def allowed?(owner)
      if owner == current_user || current_user.admin?
        true
      else
        false
      end
    end


    def current_user
        User.find(session[:user_id]) if session[:user_id]
    end

    def image_link_to(image_path, url, image_tag_options = { }, link_to_options = { })
      link_to url, link_to_options do
        image_tag image_path, image_tag_options
      end
    end
    
end
