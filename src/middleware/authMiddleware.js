import jwt from 'jsonwebtoken';
import { prisma } from "../database/db.js";

//Read the token fromt the request header
//Check if the token is valid
export const authMiddleware = async (req, res, next) => {
    console.log("authMiddleware called");

    let token;
    if (req.headers.authorization && req.headers.authorization.startsWith("Bearer")) {
        token = req.headers.authorization.split(" ")[1];
    } 
    else if (req.cookies?.jwt) {
        token = req.cookies.jwt;
    }

    if (!token) {
        return res.status(401).json({ message: "Not authorized, no token" });
    }

    try {
        //verify token and extract user id
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        const user = await prisma.user.findUnique({ where: { id: decoded.id } });

        if (!user) {
            return res.status(401).json({ message: "Not authorized, user not found" });
        }

        req.user = user; // Attach the user object to the request
    } catch (error) {
        console.error("Error in authMiddleware:", error);
        return res.status(401).json({ message: "Not authorized, token failed" });
    }
    next();
}