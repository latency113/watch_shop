const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

exports.get = async (req, res) => {
  const categories = await prisma.order.findMany({
    include: {
      detail: true,
    },
  });
  res.json(categories);
};

exports.getById = async (req, res) => {
  const { id } = req.params;
  const categories = await prisma.order.findUnique({
    where: {
      id: parseInt(id),
    },
    include: {
      detail: true,
    },
  });
  res.json(categories);
};

exports.create = async (req, res) => {
   const { user_id, order_date, status, payment_date } = req.body;
 
   try {
     const order = await prisma.order.create({
       data: {
         user_id: parseInt(user_id, 10), // Directly assign user_id
         order_date: order_date ? new Date(order_date) : undefined, 
         status,
         payment_date: payment_date ? new Date(payment_date) : null,
       }
     });
 
     res.json(order);
   } catch (error) {
     res.status(500).json({ error: error.message });
   }
 };
 
 

exports.update = async (req, res) => {
  const { id } = req.params
  const { name } = req.body;
  try {
    const order = await prisma.order.update({
      where : {
        id: parseInt(id),
      },
      data: {
        name: name,
      },
    });
    res.json(order);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.delete = async (req,res) => {
  const { id } =req.params
  try {
    const order = await prisma.order.delete({
      where: {
        id: id,
      }
    })
    res.json(order)
  } catch (error) {
    res.status(500).json({ error: error.message})
  }
}
