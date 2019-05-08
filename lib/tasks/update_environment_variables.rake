# frozen_string_literal: true

namespace :heroku do
  desc :"Update Heroku environment variables"
  task :update_configs do
    changes = Hash.new{ |h,k| h[k] = [] }
    errors = changes.dup
    current_vars = File.readlines('./config/application.yml')
    current_vars.each do |line|
      if !line.match?(/^\s*[\#\n]/)
        matches = line.match(/(?<key>.*?): (?<value>.*?)\n?$/)
        heroku_var = `heroku config:get #{matches['key']}`.strip
        if heroku_var != matches['value']
          set = `heroku config:set #{matches['key']}=#{matches['value']}`
          if set && heroku_var == ''
            changes[:added] << matches['key']
          elsif set
            changes[:modified] << matches['key']
          elsif heroku_var == ''
            errors[:add] << matches['key']
          else
            errors[:modify] << matches['key']
          end
        else
          changes[:unchanged] << matches['key']
        end
      end
    end

    changes.each do |message,keys|
      puts "#{message.to_s.capitalize}: #{keys.join(", ")}"
    end

    errors.each do |message,keys|
      puts "Unable to #{message.to_s}: #{keys.join(", ")}"
    end
  end
end
