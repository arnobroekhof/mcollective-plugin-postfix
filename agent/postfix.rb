module MCollective
  module Agent
    class Postfix<RPC::Agent

      action "mailq" do
	out = ""
	run("/usr/sbin/postqueue -p", :stdout => out, :chomp => true )
	reply[:output] = out
      end

      action "flush" do
	out = ""
	run("/usr/sbin/postqueue -f", :stdout => out, :chomp => true )
	reply[:output] = "Flushed all messages from queue"
      end

      action "empty" do
	out = ""
	run("/usr/sbin/postsuper -d ALL", :stdout => out, :chomp => true )
	reply[:output] = "Removed all messages from queue"
      end

      action "log" do
        if File.exist?("/var/log/maillog")
          mail_log = "/var/log/maillog"
        else
          mail_log = "/var/log/mail.log"
        end

	out = ""
	run("tail -n 10 #{mail_log}", :stdout => out, :chomp => true )
	reply[:output] = out
      end

    end
  end
end

# vi:tabstop=2:expandtab:ai:filetype=ruby
