'use strict'

const repository = (connection) => {
  const {db, ObjectID} = connection

  const getCinemasByCity = (cityId) => {
    return new Promise((resolve, reject) => {
        resolve({
          "cinema": "frozne 2",
          "city": "delhi",
          "cityId": cityId
        })
    })
  }

  const getCinemaById = (cinemaId) => {
    return new Promise((resolve, reject) => {
      resolve({
        "cinema": "endgame",
        "city": "mumbai",
        "cinemaId": 2
      })      
    })
  }

  const getCinemaScheduleByMovie = (options) => {
    return new Promise((resolve, reject) => {
      resolve({
        "cinema": "endgame",
        "city": "mumbai",
        "timeslots": ["9-12", "12-15", "15-18", "18-21"],
        "cinemaId": 2
      })          
    })
  }

  const disconnect = () => {
    db.close()
  }

  return Object.create({
    getCinemasByCity,
    getCinemaById,
    getCinemaScheduleByMovie,
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
