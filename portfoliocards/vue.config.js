module.exports = {
    css: {
        extract: false,
    },

    configureWebpack: {
        optimization: {
            splitChunks: false
        }
    },

    transpileDependencies: [
      'vuetify'
    ]
}
