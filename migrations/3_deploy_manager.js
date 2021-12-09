const ContractManager = artifacts.require('ContractManager')
const UserStorager = artifacts.require('UserStorage')
const TweetStorage = artifacts.require('TweetStorage')

module.exports = deployer => {
  deployer
    .deploy(ContractManager)
    .then(() => {
      return ContractManager.deployed()
    })
    .then(manager => {
      return Promise.all([
        manager.setAddress('UserStorage', UserStorager.address),
        manager.setAddress('TweetStorage', TweetStorage.address)
      ])
    })
}
