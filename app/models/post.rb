class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_uniqueness_of :file_name

  before_save :default_values
  def default_values
    self.publish_time ||= self.created_at
    self.file_name ||= self.publish_time.strftime('%Y-%m-%d') + ' ' + self.title + '.md'
    self.published ||= true
  end

  acts_as_taggable
end
