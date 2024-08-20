const express = require('express')

const cors = require('cors')

const app = express()

// middleware
app.use(express.json())

app.use(express.urlencoded({ extended: true }))

const productsRoutes = require('./routes/productsRoutes.js')
app.use('/api/products', productsRoutes)

const usersRoutes = require('./routes/usersRoutes.js')
app.use('/api/users', usersRoutes)

const purchasesRoutes = require('./routes/purchasesRoutes.js')
app.use('/api/purchases', purchasesRoutes)

const newslettersRoutes = require('./routes/newslettersRoutes.js')
app.use('/api/newsletters', newslettersRoutes)

const reviewsRoutes = require('./routes/reviewsRoutes.js')
app.use('/api/reviews', reviewsRoutes)

const categoriesRoutes = require('./routes/categoriesRoutes.js')
app.use('/api/categories', categoriesRoutes)

const usersGroupsRoutes = require('./routes/usersGroupsRoutes.js')
app.use('/api/usersGroups', usersGroupsRoutes)


//static Images Folder
app.use('/Images', express.static('./Images'))

//port
const PORT = process.env.PORT || 8080

//server
app.listen(PORT, () => {
    console.log(`server is running on port ${PORT}`)
})