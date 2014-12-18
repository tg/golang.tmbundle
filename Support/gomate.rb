#!/usr/bin/env ruby18

require "#{ENV['TM_SUPPORT_PATH']}/lib/escape"
require "#{ENV['TM_SUPPORT_PATH']}/lib/exit_codes"
require "#{ENV['TM_SUPPORT_PATH']}/lib/ui"
require "#{ENV['TM_SUPPORT_PATH']}/lib/web_preview"
require "#{ENV['TM_SUPPORT_PATH']}/lib/tm/executor"
require "#{ENV['TM_SUPPORT_PATH']}/lib/tm/save_current_document"

# TextMate's special GOPATH used in .tm_properties files prepended to the environment's GOPATH
ENV['GOPATH'] = (ENV.has_key?('TM_GOPATH') ? ENV['TM_GOPATH'] : '') +
                (ENV.has_key?('GOPATH') ? ':' + ENV['GOPATH'] : '')
                
module Go
  def Go::go(command, options={})
    # TextMate's special TM_GO or expect 'go' on PATH
    go_cmd = ENV['TM_GO'] || 'go'
    TextMate.save_if_untitled('go')
    TextMate::Executor.make_project_master_current_document

    args = options[:args] ? options[:args] : []
    opts = {:use_hashbang => false, :version_args => ['version'], :version_regex => /\Ago version (.*)/}
    opts[:verb] = options[:verb] if options[:verb]

    if command == 'run'
      file_length = ENV['TM_DIRECTORY'].length + 1
      go_file = ENV['TM_FILEPATH'][file_length..-1]
      args.push(go_file)
      opts[:chdir] = ENV['TM_DIRECTORY']
    else
      # Default to running against directory, which in go should be the package
      # Useful for more cases, like install and build
      # Assumes a standard setup and may not function with all pkg managers
      opts[:chdir] = ENV['TM_DIRECTORY']
      pkg_length = ENV['GOPATH'].length + 4 # GOPATH + /src/
      go_pkg = ENV['TM_DIRECTORY'][pkg_length..-1] # subtract above, is pkg name
      args.push("-v") # list packages being operated on
      args.push(go_pkg)
    end
    args.push(opts)

    TextMate::Executor.run(go_cmd, command, *args)
  end

  def Go::godoc
    # TextMate's special TM_GODOC or expect 'godoc' on PATH
    godoc_cmd = ENV['TM_GODOC'] || 'godoc'
    term = STDIN.read.strip
    TextMate.save_if_untitled('go')

    if term.nil? || term.empty?
      term = TextMate::UI.request_string( :title => 'Go Documentation Search',
                                          :prompt => 'Enter a term to search for:',
                                          :button1 => 'Search')
    end

    TextMate.exit_show_tool_tip('Please select a term to look up.') if term.nil? || term.empty?

    args = []
    args.push(godoc_cmd)
    args.push('-html')
    args.push('-tabwidth=0')
    args.concat term.split('.')

    out, err = TextMate::Process.run(*args)

    if err.nil? || err == ''
      html_header("Documentation for #{term}", "go")
      puts out
      html_footer
      TextMate.exit_show_html
    else
      TextMate.exit_show_tool_tip(err)
    end
  end
end

