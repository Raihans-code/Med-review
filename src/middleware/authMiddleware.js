import jwt from 'jsonwebtoken';
import { prisma } from "../database/db.js";

//Read the token fromt the request header
//Check if the token is valid
export const authMiddleware = async (req, res, next) => {
    console.log("authMiddleware called");
    next();
}