const { defineConfig } = require('cypress')

module.exports = defineConfig({
  e2e: {
    setupNodeEvents(on, config) { },
    //acesso ao site/ambiente
    baseUrl: 'http://demo.nopcommerce.com',
  },
})
