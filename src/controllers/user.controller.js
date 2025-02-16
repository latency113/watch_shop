const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const multer = require("multer");
const bcrypt = require("bcrypt");

// ตั้งค่า multer สำหรับอัปโหลดรูปภาพ
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "images/");
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);
    cb(
      null,
      file.fieldname +
        "-" +
        uniqueSuffix +
        "." +
        file.originalname.split(".").pop()
    );
  },
});

const upload = multer({ storage: storage });

exports.update = async (req, res) => {
  upload.single("picture")(req, res, async (err) => {
    if (err) {
      return res.status(400).json({ error: err.message });
    }
    const { id } = req.params; // Assuming you have the user's ID in req.params
    const { name, email, password, tel, address } = req.body;
    const picture = req.file ? req.file.filename : null;

    try {
      const hashedPassword = await bcrypt.hash(password, 10); // Hash the password!

      const user = await prisma.user.update({
        where: { id: parseInt(id) }, 
        data: {
          name,
          email,
          address,
          password: hashedPassword,
          tel,
          picture,
        },
      });
      res.json(user);
    } catch (error) {
      console.error("Error creating user:", error); // Log the full error
      res.status(500).json({ error: error.message });
    }
  });
};

exports.get = async (req, res) => {
  try {
    const users = await prisma.user.findMany({
      select: {
        id: true,
        name: true,
        email: true,
        address: true,
        tel: true,
        picture: true,
      },
    });

    const usersWithUrls = users.map(user => ({
      ...user,
      pictureUrl: user.picture ? `${req.protocol}://${req.get('host')}/images/${user.picture}` : null
    }));

    res.json(usersWithUrls);
  } catch (error) {
    console.error("Error getting users:", error);
    res.status(500).json({ error: "An error occurred" });
  }
};

exports.getById = async (req, res) => {
  const { id } = req.params;
  try {
    const user = await prisma.user.findUnique({
      where: {
        id: parseInt(id),
      },
      select: {
        id: true,
        name: true,
        email: true,
        address: true,
        tel: true,
        picture: true,
        order: true, 
      },
    });

    if (!user) { 
      return res.status(404).json({ error: "User not found" });
    }

    const userWithUrl = { 
      ...user,
      pictureUrl: user.picture ? `${req.protocol}://${req.get('host')}/images/${user.picture}` : null,
    };

    res.json(userWithUrl);
  } catch (error) {
    console.error("Error getting user by ID:", error);
    res.status(500).json({ error: "An error occurred" });
  }
};


exports.delete= async (req, res) => {
  const { id } = req.params;
  try {
    const users = await prisma.user.delete({
      where: {
        id: parseInt(id),
      },
    });
    res.json({message:"success" ,users});
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
