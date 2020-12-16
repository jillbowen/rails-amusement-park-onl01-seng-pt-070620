class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        user_ticket_count = self.user.tickets - self.attraction.tickets
        user_nausea = self.user.nausea + self.attraction.nausea_rating
        user_happiness = self.user.happiness + self.attraction.happiness_rating

        self.user.update(
            :tickets => user_ticket_count,
            :nausea => user_nausea,
            :happiness => user_happiness
        )
        
        if user.tickets < attraction.tickets && user.height < attraction.min_height
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        else user.height < attraction.min_height
            "Sorry. You are not tall enough to ride the Roller Coaster."
        end
    end
end
