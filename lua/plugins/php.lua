return {
  {
    "ta-tikoma/php.easy.nvim",
    config = true,
    keys = {
      { "-b", "<CMD>PHPEasyDocBlock<CR>" },
      { "-r", "<CMD>PHPEasyReplica<CR>" },
      { "-c", "<CMD>PHPEasyCopy<CR>" },
      { "-d", "<CMD>PHPEasyDelete<CR>" },
      { "-ii", "<CMD>PHPEasyInitInterface<CR>" },
      { "-ic", "<CMD>PHPEasyInitClass<CR>" },
      { "-iac", "<CMD>PHPEasyInitAbstractClass<CR>" },
      { "-it", "<CMD>PHPEasyInitTrait<CR>" },
      { "-ie", "<CMD>PHPEasyInitEnum<CR>" },
      { "-c", "<CMD>PHPEasyAppendConstant<CR>", mode = { "n", "v" } },
      { "-p", "<CMD>PHPEasyAppendProperty<CR>", mode = { "n", "v" } },
      { "-m", "<CMD>PHPEasyAppendMethod<CR>", mode = { "n", "v" } },
      { "-_", "<CMD>PHPEasyAppendConstruct<CR>" },
      { "-a", "<CMD>PHPEasyAppendArgument<CR>" },
    },
  },
}
