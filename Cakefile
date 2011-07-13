
{spawn} = require 'child_process'


task 'dev', () ->
  p = spawn "coffee", ['-cwo', 'lib', 'src']
  p.stderr.on 'data', (data) -> process.stderr.write data
  p.stdout.on 'data', (data) -> process.stdout.write data

