# (c) goodprogrammer.ru

# Модель вопроса.
#
# Каждый экземпляр этого класса — загруженная из БД информация о конкретном
# вопросе.
class Question < ActiveRecord::Base
  # Эта команда добавляет связь с моделью User на уровне объектов она же
  # добавляет метод .user к данному объекту.
  #
  # Вспоминайте уроки про рельционные БД и связи между таблицами.
  #
  # Когда мы вызываем метод user у экземпляра класса Question, рельсы
  # поймут это как просьбу найти в базе объект класса User со значением id
  # равный question.user_id.
  belongs_to :user
  belongs_to :author, class_name: 'User'

  has_and_belongs_to_many :tags

  # Эта валидация препятствует созданию вопросов, у которых нет пользователя
  # если задан пустой текст вопроса (поле text пустое), объект не будет сохранен
  # в базу.
  validates :user, :text, presence: true

  # Валидации для домашенго задания
  validates :text, length: { maximum: 255 }

  #Tags
  after_save :create_tags

  private

  def create_tags
    transaction do
      self.tags.clear
      all_hashtags(self.text.concat(" ",self.answer)).each do |tag|
        self.tags << Tag.find_or_create_by(body: tag)
      end
    end
  end

  def all_hashtags(str)
    #Массив хештегов
    str.downcase.scan(/(?:(?<=\s)|^)#(\w*[A-Za-zа-яА-Я_]+\w*)/).flatten.uniq
  end
end
