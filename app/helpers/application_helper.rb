module ApplicationHelper
    def render_nav_links
        content_tag("ul") do
            if true # is logged in
                content_tag("li")do
                    link_to("Chores", chores_path)
                end +
                content_tag("li") do
                    link_to("Add Chore", new_chore_path)
                end
            else  
                content_tag("li")do
                    link_to("Login", "#")
                end +
                content_tag("li") do
                    link_to("Signup", "#")
                end
            end
        end
    end
end
