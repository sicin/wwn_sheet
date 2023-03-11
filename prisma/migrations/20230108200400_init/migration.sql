-- CreateTable
CREATE TABLE "Character" (
    "id" TEXT NOT NULL,
    "background" VARCHAR(64) NOT NULL DEFAULT 'Not chosen',
    "occupation" VARCHAR(64) NOT NULL DEFAULT 'Not chosen',
    "class" VARCHAR(32) NOT NULL DEFAULT 'Not chosen',
    "species" VARCHAR(64) NOT NULL DEFAULT 'Human',
    "name" VARCHAR(256) DEFAULT 'Anonymous',
    "homeland" VARCHAR(256),
    "goal" VARCHAR(256),
    "description" TEXT,
    "image" TEXT,
    "experience" INTEGER NOT NULL DEFAULT 0,
    "renown" INTEGER NOT NULL DEFAULT 0,
    "hp" INTEGER NOT NULL DEFAULT 0,
    "totalMoney" INTEGER NOT NULL DEFAULT 0,
    "stashedMoney" INTEGER NOT NULL DEFAULT 0,
    "isAlive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Stats" (
    "id" SERIAL NOT NULL,
    "strength" INTEGER NOT NULL DEFAULT 0,
    "strengthModifier" INTEGER,
    "dexterity" INTEGER NOT NULL DEFAULT 0,
    "dexterityModifier" INTEGER,
    "constitution" INTEGER NOT NULL DEFAULT 0,
    "constitutionModifier" INTEGER,
    "intelligence" INTEGER NOT NULL DEFAULT 0,
    "intelligenceModifier" INTEGER,
    "wisdom" INTEGER NOT NULL DEFAULT 0,
    "wisdomModifier" INTEGER,
    "charisma" INTEGER NOT NULL DEFAULT 0,
    "charismaModifier" INTEGER,

    CONSTRAINT "Stats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Skills" (
    "id" SERIAL NOT NULL,
    "admin" INTEGER,
    "connect" INTEGER,
    "convince" INTEGER,
    "craft" INTEGER,
    "exert" INTEGER,
    "heal" INTEGER,
    "know" INTEGER,
    "lead" INTEGER,
    "magic" INTEGER,
    "notice" INTEGER,
    "perform" INTEGER,
    "pray" INTEGER,
    "punch" INTEGER,
    "ride" INTEGER,
    "sail" INTEGER,
    "shoot" INTEGER,
    "sneak" INTEGER,
    "stab" INTEGER,
    "survive" INTEGER,
    "trade" INTEGER,
    "work" INTEGER,

    CONSTRAINT "Skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Foci" (
    "id" SERIAL NOT NULL,
    "snipersEye" INTEGER,
    "developedAttribute" INTEGER,

    CONSTRAINT "Foci_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClassAbilities" (
    "ability_id" SERIAL NOT NULL,
    "masterfulExpertise" BOOLEAN NOT NULL DEFAULT false,
    "quickLearner" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ClassAbilities_pkey" PRIMARY KEY ("ability_id")
);

-- CreateTable
CREATE TABLE "Items" (
    "id" SERIAL NOT NULL,

    CONSTRAINT "Items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Spells" (
    "id" SERIAL NOT NULL,

    CONSTRAINT "Spells_pkey" PRIMARY KEY ("id")
);
