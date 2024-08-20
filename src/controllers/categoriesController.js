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

// 1. create category
const addCategory = async (req, res) => {

    let row = {
        imageUrl        : req.body.imageUrl,
        title           : req.body.title,
        description     : req.body.description
    }

    const category = await Category.create(row)
    
    res.status(200).send(category)
    
    console.log(category)

}

// 2. get all categories
const getAllCategories = async (req, res) => {

    let categories = await Category.findAll({})
    
    res.status(200).send(categories)

}

// 3. get single category
const getOneCategory = async (req, res) => {

    let id = req.params.id
    
    let category = await Category.findOne({ where: { id: id }})
    
    res.status(200).send(category)

}

// 4. update category
const updateCategory = async (req, res) => {

    let id = req.params.id

    let row = {
        imageUrl        : req.body.imageUrl,
        title           : req.body.title,
        description     : req.body.description
    }

    Category.update(row, { where: { id: id }})
    .then(()=>{
       Category.findOne({ where: { id: id }})
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

// 5. delete category by id
const deleteCategory = async (req, res) => {

    let id = req.params.id
    
    console.log(id);
    
    await Category.destroy({ where: { id: id }} )

    res.status(200).send(`Category is deleted !`)

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
    addCategory,
    getAllCategories,
    getOneCategory,
    updateCategory,
    deleteCategory,
    upload
    
}