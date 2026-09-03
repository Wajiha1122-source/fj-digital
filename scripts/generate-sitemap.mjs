import { mkdirSync, writeFileSync } from "node:fs";
import { staticRoutes } from "../seo-routes.mjs";

const SITE_URL = (process.env.SITE_URL || "https://fjdigital.co").replace(/\/$/, "");

const escapeXml = (value) =>
  value
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&apos;");

const urls = staticRoutes.map(({ path, lastmod }) => {
  const fullUrl = new URL(path, `${SITE_URL}/`).href;
  const lastModified = lastmod
    ? `\n    <lastmod>${escapeXml(lastmod)}</lastmod>`
    : "";

  return `  <url>\n    <loc>${escapeXml(fullUrl)}</loc>${lastModified}\n  </url>`;
});

const sitemap = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${urls.join("\n")}
</urlset>
`;

const publicDirectory = new URL("../public/", import.meta.url);

mkdirSync(publicDirectory, { recursive: true });
writeFileSync(new URL("sitemap.xml", publicDirectory), sitemap, "utf8");

console.log(`Generated sitemap with ${staticRoutes.length} URLs for ${SITE_URL}.`);
