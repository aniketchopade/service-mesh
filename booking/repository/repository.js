'use strict'

const repository = (db) => {
  const collection = {
    "movies": "movies"
  }

  const makeBooking = () => {
    return new Promise((resolve, reject) => {
        resolve({
          "name": "insaniyat",
          "description": "result of getallMovies"
        })
    })
  }


  const disconnect = () => {
    db.close()
  }

  return Object.create({
    makeBooking,
    disconnect
  })
}

const connect = (connection) => {
  return new Promise((resolve, reject) => {
    if (!connection) {
      reject(new Error('connection db not supplied!'))
    }
    resolve(repository(connection))
  })
}

module.exports = Object.assign({}, {connect})
