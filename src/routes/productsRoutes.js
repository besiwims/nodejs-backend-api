// import controllers review, products
const productsController = require('../controllers/productsController.js')

// router
const router = require('express').Router()

//products routes
router.post('/addProduct', productsController.addProduct)
router.put('/updateProduct/:id', productsController.updateProduct)
router.delete('/deleteProduct/:id', productsController.deleteProduct)
router.get('/allProducts', productsController.getAllProducts)
router.get('getOneProduct/:id', productsController.getOneProduct)

module.exports = router
