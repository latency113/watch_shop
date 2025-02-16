const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

exports.get = async (req, res) => {
  const order = await prisma.order.findMany({
    include: {
      detail: true,
    },
  });
  res.json(order);
};

exports.getById = async (req, res) => {
  const { id } = req.params;
  const order = await prisma.order.findUnique({
    where: {
      id: parseInt(id),
    },
    include: {
      detail: true,
    },
  });
  res.json(order);
};

exports.create = async (req, res) => {
  const { user_id, order_date, status, payment_date } = req.body;

  try {
    const order = await prisma.order.create({
      data: {
        user: { connect: { id: parseInt(user_id) } },
        order_date: order_date ? new Date(order_date) : undefined,
        status,
        payment_date: payment_date ? new Date(payment_date) : null,
      },
    });

    res.json(order);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to create order" }); // ส่งข้อความ error ทั่วไป
  }
};

exports.update = async (req, res) => {
  const { id } = req.params;
  const { status } = req.body;
  try {
    const order = await prisma.order.update({
      where: {
        id: parseInt(id),
      },
      data: {
        status:status,
      },
    });
    res.json(order);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.delete = async (req, res) => {
  const { id } = req.params;
  try {
    const order = await prisma.order.delete({
      where: {
        id: parseInt(id),
      },
    });
    res.json({message:"success" ,order});
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
