import "dotenv/config";
import bcrypt from "bcrypt";
import { PrismaClient } from "@prisma/client";
import { PrismaPg } from "@prisma/adapter-pg";

const adapter = new PrismaPg({ connectionString: process.env.DATABASE_URL });
const prisma = new PrismaClient({ adapter });

const createUser = async () => {
  try {
    const passwordHash = await bcrypt.hash("Password123!", 10);

    const users = [
      {
        firstName: "Marna",
        lastName: "Tapp",
        email: "mtapp0@rambler.ru",
        phone: "12345678901",
        nid: "12345678901234567",
        passwordHash,
      },
      {
        firstName: "Selina",
        lastName: "Farfull",
        email: "sfarfull1@cam.ac.uk",
        phone: "12345678902",
        nid: "12345678901234568",
        passwordHash,
      },
    ];

    const result = await prisma.user.createMany({
      data: users,
      skipDuplicates: true,
    });

    console.log(`Seeded ${result.count} users successfully`);
  } catch (error) {
    console.error("Error creating user:", error);
    process.exitCode = 1;
  } finally {
    await prisma.$disconnect();
  }
};

createUser();