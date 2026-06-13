-- CreateTable
CREATE TABLE "MedicalService" (
    "serviceId" UUID NOT NULL,
    "hospitalId" UUID NOT NULL,
    "serviceName" VARCHAR(150) NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MedicalService_pkey" PRIMARY KEY ("serviceId")
);
