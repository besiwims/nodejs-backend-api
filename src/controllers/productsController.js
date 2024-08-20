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

// 1. create product
const addProduct = async (req, res) => {

    let row = {
        imageUrl        : req.body.imageUrl,
        title           : req.body.title,
        price           : req.body.price,
        quantity        : req.body.quantity,
        units           : req.body.units,
        description     : req.body.description
    }

    const product = await Product.create(row)
    
    res.status(200).send(product)
    
    console.log(product)

}

// 2. get all products
const getAllProducts = async (req, res) => {

    let products = await Product.findAll({})
    
    res.status(200).send(products)

}

// 3. get single product
const getOneProduct = async (req, res) => {

    let id = req.params.id
    
    let product = await Product.findOne({ where: { id: id }})
    
    res.status(200).send(product)

}

// 4. update Product
const updateProduct = async (req, res) => {

    let id = req.params.id

    let row = {
        imageUrl        : req.body.imageUrl,
        title           : req.body.title,
        price           : req.body.price,
        quantity        : req.body.quantity,
        units           : req.body.units,
        description     : req.body.description
    }

    Product.update(row, { where: { id: id }})
    .then(()=>{
       Product.findOne({ where: { id: id }})
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

// 5. delete product by id
const deleteProduct = async (req, res) => {

    let id = req.params.id
    
    console.log(id);
    
    await Product.destroy({ where: { id: id }} )

    res.status(200).send(`Product is deleted !`)

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
    addProduct,
    getAllProducts,
    getOneProduct,
    updateProduct,
    deleteProduct,
    upload
    
}