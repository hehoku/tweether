const TweetStorage = artifacts.require('TweetStorage')
const TweetController = artifacts.require('TweetController')
const utils = require('../utils')
const { assertVMException } = utils

contract('tweets', () => {
  it('can create tweet with controller', async () => {
    const controller = await TweetController.deployed()
    const tx = await controller.createTweet(1, 'Hello world!')
    assert.isOk(tx)
  })
  it("can't create tweet without controller", async () => {
    const storage = await TweetStorage.deployed()

    try {
      const tx = await storage.createTweet(1, 'tristan')
      assert.fail()
    } catch (e) {
      assertVMException(e)
    }
  })

  it('can get tweet', async () => {
    const storage = await TweetStorage.deployed()

    const tweet = await storage.tweets.call(1)
    const { id, text, userId } = tweet

    assert.equal(parseInt(id), 1)
    assert.equal(text, 'Hello world!')
    assert.equal(parseInt(userId), 1)
  })
})
