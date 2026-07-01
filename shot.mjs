import { chromium } from "playwright-core";
const b = await chromium.launch({ executablePath: "/opt/pw-browsers/chromium-1194/chrome-linux/chrome" });
const p = await (await b.newContext({ viewport:{width:1280,height:820}, deviceScaleFactor:2 })).newPage();
await p.goto("http://localhost:3000/learn/history/ancient-history/rome", { waitUntil: "networkidle" });
await p.waitForTimeout(800);
await p.screenshot({ path: process.argv[2] + "/reader-tree.png" });
await b.close(); console.log("ok");
