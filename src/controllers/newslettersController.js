const userModel = require('../models/userModel.js')
const newsletterModel = require('../models/newsletterModel.js')

// image Upload
const multer = require('multer')
const path = require('path')

// models
const User = userModel.users
const Newsletter = newsletterModel.newsletters

// 1. create newsletter
const addNewsletter = async (req, res) => {

    let row = {
        imageUrl        : req.body.imageUrl,
        title           : req.body.title,
        volume          : req.body.volume,
        quantity        : req.body.quantity,
        date            : req.body.date,
        description     : req.body.description
    }

    const newsletter = await Newsletter.create(row)
    
    res.status(200).send(newsletter)
    
    console.log(newsletter)

}

// 2. get all newsletters
const getAllNewletters = async (req, res) => {

    let newsletters = await Newsletter.findAll({})
    
    res.status(200).send(newsletters)

}

// 3. get single newsletter
const getOneNewsletter = async (req, res) => {

    let id = req.params.id
    
    let newsletter = await Newsletter.findOne({ where: { id: id }})
    
    res.status(200).send(newsletter)

}

// 4. update Newsletter
const updateNewsletter = async (req, res) => {

    let id = req.params.id
    
    let row = {
        imageUrl        : req.body.imageUrl,
        title           : req.body.title,
        volume          : req.body.volume,
        quantity        : req.body.quantity,
        date            : req.body.date,
        description     : req.body.description
    }

    Newsletter.update(row, { where: { id: id }})
    .then(()=>{
       Newsletter.findOne({ where: { id: id }})
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

// 5. delete newsletter by id
const deleteNewsletter = async (req, res) => {

    let id = req.params.id
    
    console.log(id);
    
    await Newsletter.destroy({ where: { id: id }} )

    res.status(200).send(`Newsletter is deleted !`)

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
    addNewsletter,
    getAllNewletters,
    getOneNewsletter,
    updateNewsletter,
    deleteNewsletter,
    upload
    
}