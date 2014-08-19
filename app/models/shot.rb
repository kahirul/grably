class Shot < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ShotUploader

  def grab
    Delayed::Job.enqueue Job::Grabber.new(id), queue: :grabbing
  end

  def resize
    image = File.open("public/images/grabbed/#{id}.png")
    self.image = image
    self.save
  end

  def to_param
    "#{ id }-#{ url }".parameterize
  end
end
