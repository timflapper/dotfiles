require 'irb/completion'
require 'irb/ext/save-history'

# Save-history does not work out of the box.
# http://stackoverflow.com/questions/2065923/irb-history-not-working
# http://www.ruby-forum.com/topic/189523
# /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/site_ruby/1.8/irb/ext/save-history.rb
IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:HISTORY_FILE] = File.expand_path('~/.irb_history')
IRB.conf[:PROMPT_MODE]  = :SIMPLE

class Object
  def interesting_methods
    case self.class
    when Class;  self.public_methods.sort - Object.public_methods
    when Module; self.public_methods.sort - Module.public_methods
    else         self.public_methods.sort - Object.new.public_methods
    end
  end
end
