#!/usr/bin/env node

const { execSync } = require("child_process");

const REPO = "igor-ribeiro/Adv360-Pro-ZMK";
const DIR = "~/.config/adv360-firmware";

const actionsResult = execSync(
  `gh run list -L 1 --json status,databaseId -R ${REPO}`
).toString("utf8");

const { databaseId, status } = JSON.parse(actionsResult)[0];

if (status !== "completed") {
  console.log(`Action ${databaseId} not finished yet.`);
  return;
}

execSync(`rm -rf ${DIR}/*`);
execSync(`gh run download -R ${REPO} -D ${DIR} ${databaseId}`);
execSync(`mv ${DIR}/firmware/* ${DIR}`);
execSync(`rm -rf ${DIR}/firmware`);

console.log(`Firmware download in ${DIR}`);
