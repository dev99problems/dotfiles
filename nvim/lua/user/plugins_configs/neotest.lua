local neotest = require('neotest');
local vitest = require('neotest-vitest');
local jest = require('neotest-jest')

neotest.setup {
  adapters = {
    vitest,
    jest
  }
}
