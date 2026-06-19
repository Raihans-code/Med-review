/*
  Warnings:

  - You are about to drop the column `entityId` on the `Review` table. All the data in the column will be lost.
  - You are about to drop the column `entityType` on the `Review` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[nid]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Changed the type of `entityType` on the `SavedListing` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `phone` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "ListingEntity" AS ENUM ('HOSPITAL', 'DOCTOR', 'MEDICAL_SERVICE');

-- AlterTable
ALTER TABLE "Doctor" ALTER COLUMN "bmdcId" SET DATA TYPE VARCHAR(20);

-- AlterTable
ALTER TABLE "Hospital" ALTER COLUMN "country" SET DEFAULT 'Bangladesh';

-- AlterTable
ALTER TABLE "Review" DROP COLUMN "entityId",
DROP COLUMN "entityType",
ADD COLUMN     "doctorId" UUID,
ADD COLUMN     "serviceId" UUID,
ALTER COLUMN "hospitalId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "SavedListing" DROP COLUMN "entityType",
ADD COLUMN     "entityType" "ListingEntity" NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "phone" VARCHAR(11) NOT NULL;

-- DropEnum
DROP TYPE "ReviewEntity";

-- CreateIndex
CREATE INDEX "Doctor_name_idx" ON "Doctor"("name");

-- CreateIndex
CREATE INDEX "Hospital_city_idx" ON "Hospital"("city");

-- CreateIndex
CREATE INDEX "Hospital_name_idx" ON "Hospital"("name");

-- CreateIndex
CREATE INDEX "Review_doctorId_idx" ON "Review"("doctorId");

-- CreateIndex
CREATE INDEX "Review_hospitalId_idx" ON "Review"("hospitalId");

-- CreateIndex
CREATE INDEX "Review_serviceId_idx" ON "Review"("serviceId");

-- CreateIndex
CREATE INDEX "Review_status_idx" ON "Review"("status");

-- CreateIndex
CREATE UNIQUE INDEX "SavedListing_userId_entityType_entityId_key" ON "SavedListing"("userId", "entityType", "entityId");

-- CreateIndex
CREATE INDEX "Specialty_slug_idx" ON "Specialty"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "User_nid_key" ON "User"("nid");

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_doctorId_fkey" FOREIGN KEY ("doctorId") REFERENCES "Doctor"("doctorId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "MedicalService"("serviceId") ON DELETE CASCADE ON UPDATE CASCADE;
