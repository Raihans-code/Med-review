-- CreateTable
CREATE TABLE "DoctorAffiliation" (
    "doctorAffiliationId" UUID NOT NULL,
    "doctorId" UUID NOT NULL,
    "hospitalId" UUID NOT NULL,
    "isPrimary" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DoctorAffiliation_pkey" PRIMARY KEY ("doctorAffiliationId")
);
