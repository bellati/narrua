require 'net/http'

class FB
  def self.get_events(access_token)
    first_page = true
    paging_next = 'https://graph.facebook.com/v2.5/me?fields=events&access_token=' + access_token

    while true do
      events = nil
      response = get_response(paging_next)
      break if !response['error'].nil? # TODO: log

      if first_page then
        events = response['events']['data']
        paging_next = response['events']['paging']['next']
        first_page = false
      else
        events = response['data']
        paging_next = response['paging']['next']
      end

      process_events(events)

      break if paging_next.nil?
    end
  end

  private
  def self.process_events(events)
    events.each do |e|
      puts e['name']
    end
  end

  def self.get_response(path)
    uri = URI(path)
    # TODO: use_ssl
    JSON.parse(Net::HTTP.get_response(uri).body)
  end
end