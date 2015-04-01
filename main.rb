# Uses 2 sub folders to keep data. '/public' for stylesheets & images, and '/views' for Slim templates.
require 'sinatra'
require 'sinatra/reloader'  
require 'slim'

get '/' do 
  slim :index   # Misspelling 'slim' will result in a 'No Method Error'. Misspelling 'index' results in Error - No such file
  # Slim automatically knows to a) look in the /views folder and b) take the symbol :index and look for a file with the 
  # same name that has the extension .slim 
end

get '/:task' do          # This route has the string "/:task" which is a named parameter (eg. the symbol :task) 
  # @task = params[:task]  # There's a 'params' hash that's part of Sinatra. @task will be the 'value' for the 'key' :task
  @task = params[:task].split('-').join(' ').capitalize # Will take "/jump-high" and turn it into "Jump high"
  slim :task             # There should be a view called "task" which should be saved as task.slim
end
# The :task has nothing to do with the address bar as much as it says "take whatever is after the last / and put that
# into the params hash under the key 'task'" In this case, whatever is typed in the address bar, such as 
# localhost:4567/stupid_stuff  will be stored as the value of the key params[:task] and in the case above, also store that
# value (the text after the last / in the address bar) into the instance variable @task

# At this point, it doesn't matter if you type in localhost:4567/fsdjkal , there's no error, but it will just show "Just Do It"
# As opposed to the other info that's found in the '/' (root) route. 

post '/' do   # 'post' verb/method as opposed to 'get' here. This means it only responds to 'POST' requests. You can define
              # multiple handlers to the same route (eg. '/'), but have 2 separate blocks to run based on the method type 
              # of request.
              
  @task = params[:task]
  slim :task
end
