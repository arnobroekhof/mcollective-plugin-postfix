class MCollective::Application::Postfix<MCollective::Application
  description "Linux Postfix broker"
  usage "postfix [mailq|flush|empty]"

  def post_option_parser(configuration)
    if ARGV.size == 1
      configuration[:command] = ARGV.shift
    end
  end

  def validate_configuration(configuration)
    raise "\nCommand should be one of: \n * mailq\n * log\n * flush\n * empty\n" unless configuration[:command] =~ /^empty|log|mailq|flush$/

  end

  def main
    mc = rpcclient("postfix")

    mc.discover :verbose => true
    mc.send(configuration[:command]).each do |node|
      case configuration[:command]
      when "mailq"
        printf("%s\n %s\n\n", node[:sender], node[:data][:output])
      when "flush"
        printf("%-40s %s\n\n", node[:sender], node[:data][:output])
      when "empty"
        printf("%-40s %s\n\n", node[:sender], node[:data][:output])
      when "log"
        printf("%s\n %s\n\n", node[:sender], node[:data][:output])
      end 
    end
    
    printrpcstats

    mc.disconnect

  end

end

# vi:tabstop=2:expandtab:ai
