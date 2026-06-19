/*
  Warnings:

  - A unique constraint covering the columns `[bmdcId]` on the table `Doctor` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `bmdcId` to the `Doctor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `qualification` to the `Doctor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nid` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "DoctorType" AS ENUM ('MBBS', 'BDS');

-- AlterTable
ALTER TABLE "Doctor" ADD COLUMN     "bmdcId" VARCHAR(6) NOT NULL,
ADD COLUMN     "doctorType" "DoctorType" NOT NULL DEFAULT 'MBBS',
ADD COLUMN     "qualification" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "nid" VARCHAR(17) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Doctor_bmdcId_key" ON "Doctor"("bmdcId");
