module CurrentUserConcern
    extend ActiveSupport::Concern
    # this overwrites the current_user method that comes with devise and says if there’s a logged in user, return them, or return a guest user
    def current_user        
        super || guest_user
    end
    
    # the guest user is created as a generic object
    def guest_user        
        OpenStruct.new(
            name: "Guest User",
            first_name: "Guest",
            last_name: "User",
            email: "guest@example.com"
        )
    end
end