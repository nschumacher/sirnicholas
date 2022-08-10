module ApplicationHelper
    def login_helper style = 'nav-link'
        if current_user.is_a?(GuestUser)
            (link_to "Register", new_user_registration_path, class: style) +
            "<br>".html_safe +
            (link_to "Login", new_user_session_path, class: style)
        else
            link_to "Logout", destroy_user_session_path, method: :delete, class: style
        end
    end

    def source_helper(layout_name)
        if session[:source]
            greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
            content_tag(:p, greeting, class: "source-greeting")
        end
    end

    def alerts
        alert = (flash[:alert] || flash[:error] || flash[:notice])
        type = ''
        if flash[:alert]
            type = 'alert'
        elsif flash[:error]
            type = 'error'
        else
            type = 'notice'
        end

        if alert
            alert_generator alert, type
        end
    end

    def alert_generator msg, type
        if type == 'alert'
            js add_gritter(msg, title: "Heads Up!", sticky: false)
        elsif type == 'error'
            js add_gritter(msg,image: :error, title: "Hold Up!", sticky: false)
        else
            js add_gritter(msg, image: :notice, sticky: false)
        end
    end
end
