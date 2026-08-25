<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:s="http://www.sitemaps.org/schemas/sitemap/0.9">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>FJ Digital XML Sitemap</title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <style>
          body{margin:0;background:#090909;color:#f5f1ec;font:16px Arial,sans-serif}main{max-width:1050px;margin:auto;padding:70px 24px}p{color:#c9bfc1;line-height:1.7}table{width:100%;margin-top:35px;border-collapse:collapse;background:#16070c}th,td{padding:18px;text-align:left;border-bottom:1px solid #ffffff20}th{color:#d78a9e;font-size:12px;letter-spacing:.12em;text-transform:uppercase}a{color:#fff}h1{font-size:clamp(38px,7vw,80px);margin:0;color:#fff}.tag{color:#d78a9e;letter-spacing:.14em;font-size:12px;text-transform:uppercase}
        </style>
      </head>
      <body><main><div class="tag">FJ Digital / Technical SEO</div><h1>XML Sitemap</h1><p>This file lists every canonical, indexable page currently available on fjdigital.co.</p><table><tr><th>URL</th><th>Last modified</th><th>Priority</th></tr><xsl:for-each select="s:urlset/s:url"><tr><td><a href="{s:loc}"><xsl:value-of select="s:loc"/></a></td><td><xsl:value-of select="s:lastmod"/></td><td><xsl:value-of select="s:priority"/></td></tr></xsl:for-each></table></main></body>
    </html>
  </xsl:template>
</xsl:stylesheet>
