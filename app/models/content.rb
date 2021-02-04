class Content < ActiveRecord::Base
    belongs_to :user

    has_attached_file :cover
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/,
    message: "Sono supportati solo i file immagine"

    has_attached_file :allegato
    validates_attachment_content_type :allegato, :content_type => [ /^image\/png|gif|jpeg/],
    message: "Formato non supportato"

end
