Job::Grabber = Struct.new(:shot_id) do

  def perform
    shot = Shot.find(shot_id)
    Phantomjs.run('lib/scripts/grabber.coffee', shot.url.to_s, shot_id.to_s)
  end

  def success(job)
    handler = YAML.load job.handler
    shot_id = handler.shot_id
    shot = Shot.find shot_id
    shot.resize
  end
end
