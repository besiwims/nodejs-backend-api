// import controller Users
const usersGroupsController = require('../controllers/usersGroupsController.js')

// router
const router = require('express').Router()

//Users routes
router.post('/addUserGroup', usersGroupsController.addUserGroup)
router.put('/updateUserGroup/:id', usersGroupsController.updateUserGroup)
router.delete('/deleteUserGroup/:id', usersGroupsController.deleteUserGroup)
router.get('/allUsersGroups', usersGroupsController.getAllUsersGroups)
router.get('getOneUserGroup/:id', usersGroupsController.getOneUserGroup)

module.exports = router
