import store from '@/store'

function processMenu() {
  const chainMenus = []
  const blockchains = []
  Object.keys(store.state.chains.config).forEach(chain => {
    if (store.state.chains.config[chain].visible) {
      const menu = {
        title: chain.toUpperCase(),
        logo: store.state.chains.config[chain].logo,
        route: { name: 'dashboard', params: { chain } },
      }
      blockchains.push(menu)
    }
  })

  if (blockchains.length > 1) {
    chainMenus.push({ header: 'networks' })
    chainMenus.push({
      title: 'testnets',
      children: blockchains,
      tag: `${blockchains.length}`,
      icon: '/logo.png',
    })
  }
  chainMenus.push({ header: 'LINKS' })
  chainMenus.push({
    title: 'Twitter',
    href: 'https://twitter.com/NibiruChain',
    icon: 'TwitterIcon',
  })
  chainMenus.push({
    title: 'FAQ',
    href: 'https://github.com/ping-pub/explorer/discussions',
    icon: 'MessageSquareIcon',
  })
  chainMenus.push({
    title: 'Github',
    href: 'https://github.com/NibiruChain',
    icon: 'GithubIcon',
  })

  return chainMenus
}

export default processMenu()
