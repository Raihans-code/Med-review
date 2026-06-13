-- CreateEnum
CREATE TYPE "LogSeverity" AS ENUM ('INFO', 'WARNING', 'ERROR', 'SECURITY');

-- CreateEnum
CREATE TYPE "ReportReason" AS ENUM ('SPAM', 'OFFENSIVE_LANGUAGE', 'HIPAA_VIOLATION', 'FALSE_INFORMATION', 'OTHER');

-- CreateTable
CREATE TABLE "ReviewReport" (
    "reportId" UUID NOT NULL,
    "reviewId" UUID NOT NULL,
    "userId" UUID NOT NULL,
    "reason" "ReportReason" NOT NULL,
    "details" TEXT,
    "isHandled" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ReviewReport_pkey" PRIMARY KEY ("reportId")
);

-- CreateTable
CREATE TABLE "SavedListing" (
    "savedId" UUID NOT NULL,
    "userId" UUID NOT NULL,
    "entityType" "ReviewEntity" NOT NULL,
    "entityId" UUID NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SavedListing_pkey" PRIMARY KEY ("savedId")
);

-- CreateTable
CREATE TABLE "SystemLog" (
    "logId" UUID NOT NULL,
    "userId" UUID,
    "action" VARCHAR(100) NOT NULL,
    "severity" "LogSeverity" NOT NULL DEFAULT 'INFO',
    "details" TEXT NOT NULL,
    "ipAddress" VARCHAR(45),
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SystemLog_pkey" PRIMARY KEY ("logId")
);
