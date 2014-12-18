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

    # Default to running against directory, which in go should be the package.
    # Doesn't hold for "go run", which needs to be executed against the file.
    # The same will happend if directory is not set.
    directory = ENV['TM_DIRECTORY']
    if directory
      opts[:chdir] = directory
    end

    if command == 'run' || !directory
      args.push(ENV['TM_FILEPATH'])
    else
      args.push("-v") # list packages being operated on
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

  def Go::gocompile
    cmd = "#{ENV['TM_BUNDLE_SUPPORT']}/compile.py"
    TextMate.save_if_untitled('go')

    args = []
    opts = {:verb => "Compiling", :use_hashbang => false}

    directory = ENV['TM_DIRECTORY']
    if directory
      opts[:chdir] = directory
      args.push(".")
    else
      args.push(ENV['TM_FILEPATH'])
    end

    args.push(opts)
    TextMate::Executor.run(cmd, *args)
  end
end
