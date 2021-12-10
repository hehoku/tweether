import React, { useEffect } from 'react'
import { eth } from '../web3/provider'

export default class Index extends React.Component {
  async componentDidMount () {
    try {
      await ethereum.enable()
      const addresses = await eth.getAccounts()
      console.log(addresses)

      const balance = await eth.getBalance(addresses[0])
      console.log(balance)
    } catch (error) {
      console.error(error)
    }
  }

  render () {
    return <div>Hello World!</div>
  }
}
