const { basename, dirname, join } = require("path");
const { createReadStream, writeFileSync, mkdirSync, rmdirSync } = require("fs");
const readline = require("readline");

let [, , filename, linesPerFile, uniqueField = "email"] = process.argv;

const SEPARATOR = ";";
const IGNORE_HEADER = String(process.env.IGNORE_HEADER) === "1";

if (["-h", "--help", "help"].includes(filename)) {
  console.log("Arguments: FILENAME LINES_PER_FILE UNIQUE_FIELD");

  return;
}

if (filename == null) {
  throw new Error("Filename is required");
}

if (linesPerFile == null) {
  throw new Error("Lines per file is required");
}

linesPerFile = Number(linesPerFile);

const readStream = createReadStream(filename, "utf8");

const [rawFilename, ext] = basename(filename).split(".");
const chunksFolder = join(`${dirname(filename)}`, "split");
const duplicatedFilename = join(
  chunksFolder,
  `DUPLICATED-${rawFilename}.${ext}`
);

const rl = readline.createInterface({
  input: readStream,
  crlfDelay: Infinity
});

rmdirSync(chunksFolder, { recursive: true });
mkdirSync(chunksFolder, { recursive: true });

let header = null;
let uniqueFieldIndex = null;
const imported = {};
let ignoredCount = 0;

let finalFileContent = "";
let chunk = null;
let chunksCount = 0;
let chunkLines = 0;
let duplicated = "";
let linesCount = 0;

function saveChunk() {
  if (chunk == null) {
    return;
  }

  const chunkFileName = `${rawFilename}-${String(chunksCount).padStart(
    2,
    0
  )}.${ext}`;

  if (IGNORE_HEADER === false) {
    chunk = header + "\n" + chunk;
  }

  writeFileSync(join(chunksFolder, chunkFileName), chunk);

  chunksCount++;

  chunk = null;
  chunkLines = 0;
}

function saveDuplicated() {
  if (ignoredCount === 0) {
    return;
  }

  writeFileSync(duplicatedFilename, duplicated);
}

rl.on("line", line => {
  // console.log('-'.repeat(50));
  // console.log('ENDS AT')
  // const endsAtLineBreak = text.charAt(text.lenth - 1) == '\n';

  // const lines = text.split('\n');

  // for (let line of textkj) {
  if (line == "") {
    return;
  }

  const columns = line.split(SEPARATOR);

  if (header == null && IGNORE_HEADER === false) {
    header = line;
    uniqueFieldIndex = columns.findIndex(column => column === uniqueField);

    return;
  }

  if (linesPerFile - 1 === chunkLines || chunk == null) {
    saveChunk();
  }

  if (IGNORE_HEADER === false) {
    const uniqueColumn = columns[uniqueFieldIndex];

    if (uniqueColumn == null) {
      // console.log('-'.repeat(20))
      // console.log(text);
      return;
    }

    if (uniqueColumn in imported) {
      // console.log('Ignoring', uniqueColumn, uniqueFieldIndex, columns)
      duplicated += uniqueColumn.trim() + "\n";
      ignoredCount++;
      return;
    }

    imported[uniqueColumn] = true;
  }

  chunk = (chunk || "") + line.trim() + "\n";
  chunkLines++;
  // }
  linesCount++;
}).on("close", () => {
  saveChunk();
  saveDuplicated();

  console.log("-".repeat(20));
  console.log(
    `- Generated ${chunksCount} file(s) with ${linesPerFile} lines each on ${chunksFolder}`
  );
  console.log(
    `- Ignored ${ignoredCount} duplicated line(s) saved on ${duplicatedFilename}`
  );
  console.log(`- ${linesCount - ignoredCount} total lines`);
});
