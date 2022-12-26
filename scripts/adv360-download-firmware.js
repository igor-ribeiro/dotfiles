#!/usr/bin/env node

const { execSync } = require("child_process");

const REPO = "igor-ribeiro/Adv360-Pro-ZMK";
const DIR = "~/.config/adv360-firmware";

const lastRunResult = execSync(`gh workflow list -R ${REPO}`).toString("utf8");

const [_label, status, id] = lastRunResult.replace(/\n/, "").split(/\t/);

if (status !== "active") {
  console.log(`Workflow ${id} not finished yet.`);
  return;
}

execSync(`gh run download -R ${REPO} -D ${DIR} ${id}`);

console.log(`Firmware download in ${DIR}`);
