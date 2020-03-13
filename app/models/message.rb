class Message < ActiveRecord::Base
    #Each message will have a conversation and userid it belongs to
    belongs_to :conversation
    belongs_to :user
    validates_presence_of :body, :conversation_id, :user_id

    #Displays time of message created
    def message_time
     created_at.strftime("%m/%d/%y")
    end
end