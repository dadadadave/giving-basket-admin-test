namespace :check do
  desc "prepare checks from unprocessed donations"
  task prepare: :environment do
    puts "preparing checks from unprocessed donations"
    Nonprofit.with_unprocessed_donations.select(:id, :name).find_each do |nonprofit|
      donations = nonprofit.donations.with_no_check
      puts "preparing check for #{nonprofit.name}: #{donations.count} donation(s)..."
      CreateCheck.call(nonprofit, donations)
    end
  end
end
