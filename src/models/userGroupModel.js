module.exports = (sequelize, DataTypes) => {

    const UserGroup = sequelize.define("userGroup", {
        
        name: {
            type: DataTypes.STRING
        },
        description: {
            type: DataTypes.TEXT
        },
        level: {
            type: DataTypes.INTEGER
        }
    
    })

    return UserGroup

}

