module ApplicationHelper

  def avatar_url(restorer)
    if restorer.avatar.present?
      restorer.avatar.url
    else
      'default_image.png'
    end
  end

end
