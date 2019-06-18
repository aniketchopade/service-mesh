'use strict'
const status = require('http-status')

module.exports = (app, options) => {
  const {repo} = options

  app.post('/booking', (req, res, next) => {
    //call payment service
    //call notification service   
    repo.makeBooking().then(movies => {
      order = {
        user: "Aniekt Chopade",
        movie: "Frozen 2",
        showtime: "June 18, 2019 9:00pm"
      }
      res.status(status.OK).json(order)
    }).catch(next)
  })
  app.get('/booking/verify/:orderId', (req, res, next) => {
    repo.makeBooking().then(movies => {
      order = {
        user: "Aniekt Chopade",
        movie: "Frozen 2",
        showtime: "June 18, 2019 9:00pm"
      }
      res.status(status.OK).json(order)
    }).catch(next)
  })
}
