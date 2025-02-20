return {
  'chrisgrieser/nvim-early-retirement',
  config = true,
  event = 'VeryLazy',
  opts = {
    retirementAgeMins = 15,
    minimumBufferNum = 5,
    notificationOnAutoClose = true,
  },
}
