const productModel = require('../models/productModel.js')
const reviewModel = require('../models/reviewModel.js')
const userModel = require('../models/userModel.js')
const categoryModel = require('../models/categoryModel.js')

// image Upload
const multer = require('multer')
const path = require('path')

// models
const Product = productModel.products
const Review = reviewModel.reviews
const User = userModel.users
const Category = categoryModel.categories

// 1. create review
const addReview = async (req, res) => {

    let row = {
        rating        : req.body.rating,
        description     : req.body.description
    }

    const review = await Review.create(row)
    
    res.status(200).send(review)
    
    console.log(review)

}

// 2. get all reviews
const getAllReviews = async (req, res) => {

    let reviews = await Review.findAll({})
    
    res.status(200).send(reviews)

}

// 4. update review
const updateReview = async (req, res) => {

    let id = req.params.id

    let row = {
        rating        : req.body.rating,
        description     : req.body.description
    }

    Review.update(row, { where: { id: id }})
    .then(()=>{
       Review.findOne({ where: { id: id }})
       .then((data)=>{
            console.log(data)
            res.status(200).send(data)
       })      
    })
    .catch((error)=>{
       console.log(error)
       res.status(200).send(error)     
    })    

}

// 5. delete review by id
const deleteReview = async (req, res) => {

    let id = req.params.id
    
    console.log(id);
    
    await Review.destroy({ where: { id: id }} )

    res.status(200).send(`Review is deleted !`)

}

// Upload Image Controller

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'Images')
    },
    filename: (req, file, cb) => {
        cb(null, Date.now() + path.extname(file.originalname))
    }
})

const upload = multer({
    storage: storage,
    limits: { fileSize: '1000000' },
    fileFilter: (req, file, cb) => {
        const fileTypes = /jpeg|jpg|png|gif/
        const mimeType = fileTypes.test(file.mimetype)  
        const extname = fileTypes.test(path.extname(file.originalname))

        if(mimeType && extname) {
            return cb(null, true)
        }
        cb('Give proper files formate to upload')
    }
}).single('image')

module.exports = {
    addReview,
    getAllReviews,
    updateReview,
    deleteReview,
    deleteProduct,
    upload
}