class NewsSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :content,
             :published,
             :user_id,
             :image_url,
             :created_at

  belongs_to :user


  def image_url
    return nil unless object.image.attached?

    Rails.application.routes.url_helpers.rails_blob_url(
      object.image,
      host: "localhost",
      port: 3000
    )
  end
end
