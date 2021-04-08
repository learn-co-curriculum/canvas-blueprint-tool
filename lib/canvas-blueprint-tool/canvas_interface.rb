require 'rest-client'
require 'json'

class CanvasInterface

  def self.associate(options)
    url = "#{ENV['CANVAS_API_PATH']}/courses/#{options[:blueprint_id]}/blueprint_templates/default/update_associations"
    payload = {
      'course_ids_to_add' => options[:course_id]
    }
    response = RestClient.put(url, payload, self.headers)
    response = JSON.parse(response)
    if response["success"]
      puts "Success: Course #{options[:course_id]} newly associated or was already associated with blueprint course #{options[:blueprint_id]}"
    else
      puts "Something went wrong while trying to associate course #{options[:course_id]} with blueprint course #{options[:blueprint_id]}"
    end
  end

  def self.sync(options)
    
    url = "#{ENV['CANVAS_API_PATH']}/courses/#{options[:blueprint_id]}/blueprint_templates/default/migrations"
    payload = {
      'comment' => "Automatic association using canvas-blueprint-tool gem",
      'send_notification' => true,
      'publish_after_initial_sync' => options[:publish_newly_associated]
    }
    response = RestClient.post(url, payload, self.headers)
    response = JSON.parse(response)
    if response["workflow_state"] == "queued"
      puts "Syncing courses from blueprint course #{options[:blueprint_id]}"
    else
      puts "Something may have gone wrong syncing courses from blueprint course #{options[:blueprint_id]}"
    end
  end
  
  def self.headers
    {
      "Authorization" => "Bearer #{ENV['CANVAS_API_KEY']}"
    }
  end
end