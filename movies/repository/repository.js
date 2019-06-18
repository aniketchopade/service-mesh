'use strict'

const repository = (db) => {
  const collection = {
    "movies": "movies"
  }

  const getAllMovies = () => {
    return new Promise((resolve, reject) => {
        resolve({
          "name": "insaniyat",
          "description": "result of getallMovies"
        })
    })
  }

  const getMoviePremiers = () => {
    return new Promise((resolve, reject) => {
        resolve({
          "name": "frozen 2",
          "description": "result of getMoviePremiers"
        })
    })
  }

  const getMovieById = (id) => {
    return new Promise((resolve, reject) => {
        resolve({
          "name": "Ek Number",
          "description": "result of getMovieById"
        })
        // if (err) {
        //   reject(new Error('An error occured fetching all movies, err:' + err))
        // }
    })
  }

  const disconnect = () => {
    db.close()
  }

  return Object.create({
    getAllMovies,
    getMoviePremiers,
    getMovieById,
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
