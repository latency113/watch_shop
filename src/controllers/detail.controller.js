const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

exports.get = async (req, res) => {
  const detail = await prisma.detail.findMany({
    include: {
      product: true,
    },
  });
  res.json(detail);
};

exports.getById = async (req, res) => {
  const { id } = req.params;
  const detail = await prisma.detail.findUnique({
    where: {
      id: parseInt(id),
    },
    include: {
      product: true,
    },
  });
  res.json(detail);
};

exports.create = async (req, res) => {
  const { product_id,order_id} = req.body;

  try {
    const detail = await prisma.detail.create({
      data: {
        product: { connect: { id: parseInt(product_id) } },
        order: { connect: { id: parseInt(order_id) } },
      },
    });

    res.json(detail);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to create detail" }); // ส่งข้อความ error ทั่วไป
  }
};


exports.delete = async (req, res) => {
  const { id } = req.params;
  try {
    const detail = await prisma.detail.delete({
      where: {
        id: parseInt(id),
      },
    });
    res.json({message:"success" ,detail});
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
