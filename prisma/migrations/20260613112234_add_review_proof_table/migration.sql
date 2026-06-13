-- CreateEnum
CREATE TYPE "ProofType" AS ENUM ('BILL', 'APPOINTMENT_NUMBER', 'FILE_UPLOAD');

-- CreateTable
CREATE TABLE "ReviewProof" (
    "proofId" UUID NOT NULL,
    "reviewId" UUID NOT NULL,
    "type" "ProofType" NOT NULL,
    "proofValue" TEXT NOT NULL,
    "uploadedAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ReviewProof_pkey" PRIMARY KEY ("proofId")
);
