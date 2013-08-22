gcl
===

### 简介 

rails代码行数(共享率)统计工具

### 用法 

1. 安装

        $ gem install gcl --source http://ruby.glodon.com
  
2. 命令行
  
        $ codelline -h
  
        Usage:./gcl [type options] [file options] [regex optios] [log options]

        Gcl options:
          -t, --type TYPE                  set the type for statistics,like: rails file.
          -f, --filepath FILEPATH          set the file path which want to statistic
          -r, --regex REGEX                set the file type which want to statistic,like: *.rb *.html.
          -l, --log LOG                    set the log with output,like: false true.

        Common options:
          -h, --help                       Show this message
          -v, --version                    Show this version
    
默认使用方法：进入到rails根目录，输入codeline即可，如下：
        
      $ codeline
      /Users/halsey/.rvm/gems/ruby-1.9.3-head/gems/rails-3.2.13
      own code line: 1610  gem code line: 28952 ratio: 94.73%100
