// import controllers review, newsletters
const newslettersController = require('../controllers/newslettersController.js')

// router
const router = require('express').Router()

//newsletters routes
router.post('/addNewsletter', newslettersController.addNewsletter)
router.put('/updateNewsletter/:id', newslettersController.updateNewsletter)
router.delete('/deleteNewsletter/:id', newslettersController.deleteNewsletter)
router.get('/allNewsletters', newslettersController.getAllNewsletters)
router.get('getOneNewsletter/:id', newslettersController.getOneNewsletter)

module.exports = router
