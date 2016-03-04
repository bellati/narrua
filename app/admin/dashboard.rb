ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
        column do
            panel "Not Approved Events" do
                table_for Event.all_from_today_or_future_not_approved.order('start_time asc').limit(10) do
                    column("Event Name") {|event| link_to(event.name, admin_event_path(event))}
                    column("Start Time") {|event| event.start_time.strftime('%d/%m %H:%M') unless event.start_time.nil?}
                    column("End Time") {|event| event.end_time.strftime('%d/%m %H:%M') unless event.end_time.nil?}
                end
            end
        end
        column do
            panel "Today Events" do
                table_for Event.all_from_today.order('start_time asc') do
                    column('Event Name') {|event| link_to(event.name, admin_event_path(event))}
                    column('Link') {|event| link_to('View On Site', event_path(event), target: "_blank")}
                end
            end
        end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
