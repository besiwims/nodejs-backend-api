// import controllers review, purchases
const purchasesController = require('../controllers/purchasesController.js')

// router
const router = require('express').Router()

//purchases routes
router.post('/addPurchase', purchasesController.addPurchase)
router.put('/updatePurchase/:id', purchasesController.updatePurchase)
router.delete('/deletePurchase/:id', purchasesController.deletePurchase)
router.get('/allpurchases', purchasesController.getAllpurchases)
router.get('getOnePurchase/:id', purchasesController.getOnePurchase)

module.exports = router
