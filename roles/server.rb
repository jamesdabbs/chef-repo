name 'server'
description 'Full bespoke configuration for a home server'
recipes = %w{ chef-client jdabbs }
run_list recipes.map { |r| "recipe[#{r}]"}