const productModel = require('../models/productModel.js')
const userModel = require('../models/userModel.js')
const purchaseModel = require('../models/purchaseModel.js')

// image Upload
const multer = require('multer')
const path = require('path')

// models
const Product = productModel.products
const User = userModel.users
const Purchase = purchaseModel.purchases

// 1. create purchase
const addPurchase = async (req, res) => {

    let row = {
        title           : req.body.title,
        totalPrice      : req.body.price,
        totalQuantity   : req.body.quantity,
        units           : req.body.units,
        description     : req.body.description
    }

    const purchase = await Purchase.create(row)
    
    res.status(200).send(purchase)
    
    console.log(purchase)

}

// 2. get all purchases
const getAllPurchases = async (req, res) => {

    let purchases = await Purchase.findAll({})
    
    res.status(200).send(purchases)

}

// 3. get single purchase
const getOnePurchase = async (req, res) => {

    let id = req.params.id
    
    let purchase = await Purchase.findOne({ where: { id: id }})
    
    res.status(200).send(purchase)

}

// 4. update Purchase
const updatePurchase = async (req, res) => {

    let id = req.params.id

    let row = {
        title           : req.body.title,
        totalPrice      : req.body.price,
        totalQuantity   : req.body.quantity,
        units           : req.body.units,
        description     : req.body.description
    }

    Purchase.update(row, { where: { id: id }})
    .then(()=>{
       Purchase.findOne({ where: { id: id }})
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

// 5. delete purchase by id
const deletePurchase = async (req, res) => {

    let id = req.params.id
    
    console.log(id);
    
    await Purchase.destroy({ where: { id: id }} )

    res.status(200).send(`Purchase is deleted !`)

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
    addPurchase,
    getAllPurchases,
    getOnePurchase,
    updatePurchase,
    deletePurchase,
    upload
    
}