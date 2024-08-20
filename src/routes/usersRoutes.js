// import controller Users
const usersController = require('../controllers/usersController.js')

// router
const router = require('express').Router()

//Users routes
router.post('/addUser', usersController.addUser)
router.put('/updateUser/:id', usersController.updateUser)
router.delete('/deleteUser/:id', usersController.deleteUser)
router.get('/allUsers', usersController.getAllUsers)
router.get('getOneUser/:id', usersController.getOneUser)

module.exports = router
