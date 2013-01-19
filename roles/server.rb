name 'server'
description 'Full bespoke configuration for a home server'

recipes = %w{
  chef-client
  jdabbs
  transmission
  mediatomb
  flexget flexget::cron
}
run_list recipes.map { |r| "recipe[#{r}]"}

default_attributes 'transmission' => { 'watch_dir_enabled' => 'true' }