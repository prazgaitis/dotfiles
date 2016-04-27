require 'rubygems'
require 'irb/completion'
require 'pp'
require 'json'

IRB.conf[:SAVE_HISTORY] = 1000

IRB.conf[:PROMPT][:MY_PROMPT] = {
  AUTO_INDENT: true,
  PROMPT_I: '> ',
  PROMPT_S: '',
  PROMPT_C: '',
  RETURN: "=> %s\n\n"
}
IRB.conf[:PROMPT_MODE] = :MY_PROMPT