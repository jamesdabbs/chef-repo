name 'server'
description 'Full bespoke configuration for a home server'

recipes = %w{
  chef-client
  transmission
  jdabbs
  jdabbs::flexget
  jdabbs::mediatomb
  jdabbs::vlc
}
run_list recipes.map { |r| "recipe[#{r}]"}

default_attributes 'transmission' => { 'watch_dir_enabled' => 'true' }