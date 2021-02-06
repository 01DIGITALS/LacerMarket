class Content < ActiveRecord::Base

    extend FriendlyId
    friendly_id :titolo, use: :slugged

    belongs_to :user

    has_many :sales

    has_attached_file :cover
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/,
    message: "Sono supportati solo i file immagine"

    has_attached_file :allegato
    validates_attachment_content_type :allegato, :content_type => [ /^image\/png|gif|jpeg/],
    message: "Formato non supportato"

    validates :titolo, :descrizione, :price, presence: true
    validates :price, numericality: { greater_than: 0.49 }
    validates :cover, attachment_presence: true
    validates :allegato, attachment_presence: true
end
