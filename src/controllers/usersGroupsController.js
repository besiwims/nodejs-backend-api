const userModel = require('../models/userModel.js')
const userGroupModel = require('../models/userGroupModel.js')

// image Upload
const multer = require('multer')
const path = require('path')

// models
const User = userModel.user
const UserGroup = userGroupModel.userGroup

// 1. create userGroup
const addUserGroup = async (req, res) => {

    let row = {
        name            : req.body.name,
        level           : req.body.level,
        description     : req.body.description
    }

    const userGroup = await UserGroup.create(row)
    
    res.status(200).send(userGroup)
    
    console.log(userGroup)

}

// 2. get all userGroups
const getAllUsersGroups = async (req, res) => {

    let usersGroups = await UserGroup.findAll({})
    
    res.status(200).send(usersGroups)

}

// 3. get single userGroup
const getOneUserGroup = async (req, res) => {

    let id = req.params.id
    
    let userGroup = await UserGroup.findOne({ where: { id: id }})
    
    res.status(200).send(userGroup)

}

// 4. update UserGroup
const updateUserGroup = async (req, res) => {

    let id = req.params.id
    
    let row = {
        name            : req.body.name,
        level           : req.body.level,
        description     : req.body.description
    }

    UserGroup.update(row, { where: { id: id }})
    .then(()=>{
       UserGroup.findOne({ where: { id: id }})
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

// 5. delete userGroup by id
const deleteUserGroup = async (req, res) => {

    let id = req.params.id
    
    console.log(id);
    
    await UserGroup.destroy({ where: { id: id }} )

    res.status(200).send(`UserGroup is deleted !`)

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
    addUserGroup,
    getAllUsersGroups,
    getOneUserGroup,
    updateUserGroup,
    deleteUserGroup,
    upload
    
}