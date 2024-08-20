const productModel = require('../models/productModel.js')
const reviewModel = require('../models/reviewModel.js')
const userModel = require('../models/userModel.js')
const categoryModel = require('../models/categoryModel.js')
const UserGroupModel = require('../models/userGroupsModel.js')

// image Upload
const multer = require('multer')
const path = require('path')

// models
const Product = productModel.products
const Review = reviewModel.reviews
const User = userModel.users
const Category = categoryModel.categories
const UserGroup = UserGroupModel

// 1. create user
const addUser = async (req, res) => {

    let row = {
        imageUrl        : req.body.imageUrl,
        company         : req.body.company,
        digitalAddress  : req.body.digitalAddress,
        registerId      : req.body.registerId,
        phone           : req.body.phone,
        password        : req.body.password
    }

    const user = await User.create(row)
    
    res.status(200).send(user)
    
    console.log(user)

}

// 2. get all users
const getAllUsers = async (req, res) => {

    let users = await User.findAll({})
    
    res.status(200).send(users)

}

// 3. get single user
const getOneUser = async (req, res) => {

    let id = req.params.id
    
    let user = await User.findOne({ where: { id: id }})
    
    res.status(200).send(user)

}

// 4. update user
const updateUser = async (req, res) => {

    let id = req.params.id

    let row = {
        imageUrl        : req.body.imageUrl,
        company         : req.body.company,
        digitalAddress  : req.body.digitalAddress,
        registerId      : req.body.registerId,
        phone           : req.body.phone,
        password        : req.body.password
    }

    User.update(row, { where: { id: id }})
    .then(()=>{
       User.findOne({ where: { id: id }})
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

// 5. delete user by id
const deleteUser = async (req, res) => {

    let id = req.params.id
    
    console.log(id);
    
    await User.destroy({ where: { id: id }} )

    res.status(200).send(`User is deleted !`)

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
    addUser,
    getAllUsers,
    getOneUser,
    updateUser,
    deleteUser,
    upload
    
}