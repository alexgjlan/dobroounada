class Invite < ActiveRecord::Base
    validates :id_bet, :id_user, presence: true
    belongs_to :bet, class_name: 'Bet', foreign_key: 'id_bet'
    belongs_to :usuario, class_name: 'Usuario', foreign_key: 'id_user'
end
