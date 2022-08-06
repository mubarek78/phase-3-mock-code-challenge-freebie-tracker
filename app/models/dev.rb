class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one? item_name
        self.freebies.any? {|f| f.item_name == item_name}
    end

    def give_away dev, freebie
        if freebie.dev_id == self.id
            freebie.dev_id = dev.id
            freebie.save
        else
            raise Exception.new "Unpermitted to perform this action."
        end
    end
end
