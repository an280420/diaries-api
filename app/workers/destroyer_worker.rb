require 'sidekiq-scheduler'

class DestroyerWorker
  include Sidekiq::Worker

  def perform(*args)
    Diary.expired.destroy_all
  end
end
