const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

exports.get = async (req, res) => {
  const categories = await prisma.category.findMany({
    include: {
      products: true,
    },
  });
  res.json(categories);
};

exports.getById = async (req, res) => {
  const { id } = req.params;
  const categories = await prisma.category.findUnique({
    where: {
      id: parseInt(id),
    },
    include: {
      products: true,
    },
  });
  res.json(categories);
};

exports.create = async (req, res) => {
  const { name } = req.body;
  try {
    const category = await prisma.category.create({
      data: {
        name : name
      },
    });
    res.json(category);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.update = async (req, res) => {
  const { id } = req.params
  const { name } = req.body;
  try {
    const category = await prisma.category.update({
      where : {
        id: parseInt(id),
      },
      data: {
        name: name,
      },
    });
    res.json(category);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.delete = async (req,res) => {
  const { id } =req.params
  try {
    const category = await prisma.category.delete({
      where: {
        id: parseInt(id),
      }
    })
    res.json({message:"success" ,category});
  } catch (error) {
    res.status(500).json({ error: error.message})
  }
}
