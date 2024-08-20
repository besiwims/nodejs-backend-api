module.exports = (sequelize, DataTypes) => {

    const Purchases = sequelize.define("purchases", {
        
        title: {
            type: DataTypes.STRING
        },
        description: {
            type: DataTypes.TEXT
        },
        totalPrice: {
            type: DataTypes.INTEGER
        },
        totalQuantity: {
            type: DataTypes.INTEGER
        },
        units: {
            type: DataTypes.STRING
        }
    
    })

    return Purchases

}
