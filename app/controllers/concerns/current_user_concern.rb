module CurrentUserConcern
    extend ActiveSupport::Concern
    # this overwrites the current_user method that comes with devise and says if there’s a logged in user, return them, or return a guest user
    def current_user        
        super || guest_user
    end
    
    # the guest user is created as a generic object
    def guest_user        
        guest = GuestUser.new
        guest.name = "Guest User"
        guest.first_name = "Guest"
        guest.last_name = "User"
        guest.email = "guest@example.com"
        guest
    end
end