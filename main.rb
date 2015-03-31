require 'sinatra'
require 'sinatra/reloader'  # The gem 'shotgun' is also used. But doesn't seem to be necessary and this statement allows
                            # for code to change and a refresh of the browser to update the changes rather than having to
                            # stop the server (ctrl-c from command line) and restarting it (eg. ruby main.rb).
                            
require 'slim'   # This is a gem that must be installed. Allows for HTML w/ no tags on elements, based solely on indentation.
                 # Slim is picky about white space and uses 2 space indents. Alternatives are ERB, Haml, Markaby.
  
get '/' do    # 'get' starts the beginning of the 'handler' which handles routes/actions. 'get' is one of the 5 HTTP 'verbs'
              # the '/' is the route, which is the root directory/URL. Therefore, if you visit "/" in the URL, this is where
              # we show what we want the code to DO - which is contained in the DO/END block. The last line of the block, just
              # like a method, is whats rendered to the browser. 
  # "Not the last line, so you don't see this" 
  # "Just Dooooo It"
  slim :index        # 
end

__END__
# Inline templates always come after the __END__ statement. 

@@layout  # Each template starts with a @@   . @@layout is a special word, and will be shown as a default view w/ all views.
doctype html
html 
  head 
    meta charset="utf-8"
    title Just Do It 
    link rel="stylesheet" media="screen, projection" href="/styles.css"
    /[if lt IE 9]
      script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"
  body 
    h1 Just Do It
    == yield        # This statement renders content from the template that called it (eg. :index)

@@index
h2 My Tasks
ul.tasks  
  li Get Milk
