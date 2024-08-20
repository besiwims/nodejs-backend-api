// import controllers review, categorys
const categoriesController = require('../controllers/categoriesController.js')

// router
const router = require('express').Router()

//categorys routes
router.post('/addCategory', categoriesController.addCategory)
router.put('/updateCategory/:id', categoriesController.updateCategory)
router.delete('/deleteCategory/:id', categoriesController.deleteCategory)
router.get('/allCategories', categoriesController.getAllCategories)
router.get('getOneCategory/:id', categoriesController.getOneCategory)

module.exports = router
