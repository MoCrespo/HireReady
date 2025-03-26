import prisma from "../libs/prisma";

async function testConnection() {
  try {
    await prisma.$connect();
    console.log("✅ Connected to database successfully");
    const users = await prisma.user.findMany();
    console.log(`📊 Total users: ${users.length}`);
  } catch (error) {
    console.error("❌ Database connection error:", error);
  } finally {
    await prisma.$disconnect();
  }
}

testConnection();
