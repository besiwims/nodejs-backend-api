// import controllers review, reviews
const reviewsController = require('../controllers/reviewsController.js')

// router
const router = require('express').Router()

//reviews routes
router.post('/addReview', reviewsController.addReview)
router.put('/updateReview/:id', reviewsController.updateReview)
router.delete('/deleteReview/:id', reviewsController.deleteReview)
router.get('/allreviews', reviewsController.getAllreviews)
router.get('getOneReview/:id', reviewsController.getOneReview)

module.exports = router
