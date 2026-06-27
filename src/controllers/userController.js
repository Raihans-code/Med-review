import prisma from "prisma"

const getAllUser =async (req,res) =>{
  const users = await prisma.User.
}