import { chromium } from "playwright";
import fs from "fs";
import path from "path";

const main = async () => {
  const customTmpDir = path.resolve("./.playwright-tmp");
  if (!fs.existsSync(customTmpDir)) {
    fs.mkdirSync(customTmpDir);
  }
  process.env.TMPDIR = customTmpDir;

  const browser = await chromium.launch();
  const page = await browser.newPage();

  await page.goto("http://localhost:4321/", { waitUntil: "networkidle" });

  await page.emulateMedia({ media: "print" });

  await page.pdf({
    path: "public/resume.pdf",
    format: "A4",
    margin: { top: "0", bottom: "0", left: "0", right: "0" },
    printBackground: true,
  });

  return browser.close();
};

main();
