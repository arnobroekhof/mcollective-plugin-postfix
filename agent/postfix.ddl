metadata    :name        => "postfix",
            :description => "An agent that can perform various tasks for postfix",
            :author      => "A.Broekhof",
            :license     => "Apache 2",
            :version     => "2.1",
            :url         => "http://github.com/arnobroekhof/mcollective-plugins/wiki",
            :timeout     => 5

action "mailq", :description => "Shows the mail queue" do
    display :always

    output :output,
           :description => "Show the mail queue",
           :display_as => "Queue"
end

action "flush", :description => "Flushes the queue" do
    display :always

    output :output,
           :description => "Flush the mail queue",
           :display_as  => "Start flush"
end

action "empty", :description => "Empty the queue" do
    display :always

    output :output,
           :description => "Empty the mail queue",
           :display_as  => "Start cleaning"
end

action "log", :description => "Show the last 10 lines of the mail log" do
    display :always

    output :output,
           :description => "The last 10 lines of the mail log file",
           :display_as  => "Log"
end
