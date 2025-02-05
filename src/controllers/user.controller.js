const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const multer = require('multer');
// const bcrypt = require('bcrypt'); 
// const authService = require('../services/auth.service');

// ตั้งค่า multer สำหรับอัปโหลดรูปภาพ
// const storage = multer.diskStorage({
//   destination: function (req, file, cb) {
//     cb(null, 'images/'); 
//   },
//   filename: function (req, file, cb) {
//     const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
//     cb(null, file.fieldname + '-' + uniqueSuffix + '.' + file.originalname.split('.').pop()); 
//   }
// });

// const upload = multer({ storage: storage });

// exports.update = async (req, res) => {
//   upload.single('picture')(req, res, async (err) => {
//     if (err) {
//       return res.status(400).json({ error: err.message });
//     }

//     const { name, email, password } = req.body;
//     const picture = req.file ? req.file.filename : null;

//     try {
//       const user = await prisma.user.create({
//         data: {
//           name,
//           email,
//           password: hashedPassword, 
//           picture,
//         },
//       });
//       res.json(user); 
//     } catch (error) {
//       res.status(500).json({ error: error.message });
//     }
//   });
// };

exports.get = async (req, res) => {
  try {
    const users = await prisma.user.findMany()
    res.json(users)
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}
