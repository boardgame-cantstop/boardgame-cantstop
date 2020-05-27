const express = require("express")
const app = express()
const number = require('./number.json')

app.use((request, response, next) => {
  response.header('Version', number.version)
  response.header('Build', number.build)
  next()
})

app.get('/', (request, response) => {
  response.send('Hello World!')
})

app.listen(process.env.PORT)
