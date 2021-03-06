module ApplicationHelper
  # Этот метод возвращает ссылку на автарку пользователя, если она у него есть.
  # Или ссылку на дефолтную аватарку, которая лежит в app/assets/images
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def sklonenie(number, one, few, many, with_number = false)
    number = 0 if number.nil? || !number.is_a?(Numeric)

    prefix = with_number ? "#{number} " : ''

    return prefix + many if (number % 100).between?(11, 14)

    word =
      case number % 10
      when 1 then one
      when 2..4 then few
      else many
      end
    prefix + word
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

end
