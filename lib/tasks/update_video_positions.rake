task :update_video_positions, [:videos] => :environment do
  videos = Video.where(position: nil)

  videos.map do |video|
    video.update_attributes(position: 0)
    video.save(validate: false)
  end
end
