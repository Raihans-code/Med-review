-- CreateTable
CREATE TABLE "Doctor" (
    "doctorId" UUID NOT NULL,
    "specialtyId" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Doctor_pkey" PRIMARY KEY ("doctorId")
);
