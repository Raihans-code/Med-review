-- CreateEnum
CREATE TYPE "ReviewEntity" AS ENUM ('HOSPITAL', 'DOCTOR', 'MEDICAL_SERVICE');

-- CreateEnum
CREATE TYPE "ApprovalStatus" AS ENUM ('PENDING', 'APPROVED', 'REJECTED');

-- CreateTable
CREATE TABLE "Review" (
    "reviewId" UUID NOT NULL,
    "userId" UUID,
    "hospitalId" UUID NOT NULL,
    "entityType" "ReviewEntity" NOT NULL,
    "entityId" UUID NOT NULL,
    "staffRating" INTEGER NOT NULL,
    "punctualityRating" INTEGER NOT NULL,
    "knowledgeRating" INTEGER,
    "bedsideRating" INTEGER,
    "overallRating" DECIMAL(3,2) NOT NULL,
    "comment" TEXT NOT NULL,
    "status" "ApprovalStatus" NOT NULL DEFAULT 'PENDING',
    "adminNotes" TEXT,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "Review_pkey" PRIMARY KEY ("reviewId")
);
