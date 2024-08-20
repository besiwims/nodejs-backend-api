module.exports = (sequelize, DataTypes) => {

    const User = sequelize.define("user", {
        
        company: {
            type: DataTypes.STRING
        },
        digitalAddress: {
            type: DataTypes.TEXT
        },
        email: {
            type: DataTypes.STRING
        },
        registerId: {
            type: DataTypes.INTEGER
        },
        phone: {
            type: DataTypes.STRING
        },
        imageUrl: {
            type: DataTypes.STRING
        },
        password : {
            type : DataTypes.STRING
        },
    
    })

    return User

}

