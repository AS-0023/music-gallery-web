<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Music Collection</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                    }
                    h1, h2, h3 {
                        color: #333;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin: 20px 0;
                    }
                    table, th, td {
                        border: 1px solid #ddd;
                    }
                    th, td {
                        padding: 10px;
                        text-align: left;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                    tr:nth-child(even) {
                        background-color: #f9f9f9;
                    }
                    ul {
                        list-style-type: none;
                        padding: 0;
                    }
                    li {
                        margin: 5px 0;
                    }
                </style>
            </head>
            <body>

                <!-- Loop through genres -->
                <xsl:for-each select="musicCollection/genre">
                    <h2>Genre: <xsl:value-of select="@name" /></h2>

                    <!-- Create a table for each genre -->
                    <table>
                        <thead>
                            <tr>
                                <th>Artist</th>
                                <th>Album (Year)</th>
                                <th>Songs</th>
                            </tr>
                        </thead>
                        <tbody>

                            <!-- Loop through artists -->
                            <xsl:for-each select="artist">
                                <xsl:variable name="artistName" select="@name" />
                                
                                <!-- Loop through albums -->
                                <xsl:for-each select="album">
                                    <tr>
                                        <!-- Artist Name -->
                                        <td rowspan="{count($artistName)}">
                                            <xsl:value-of select="$artistName" />
                                        </td>

                                        <!-- Album Title and Year -->
                                        <td><xsl:value-of select="title" /> (<xsl:value-of select="year" />)</td>

                                        <!-- List of Songs -->
                                        <td>
                                            <ul>
                                                <xsl:for-each select="songs/song">
                                                    <li>
                                                        <strong>Song:</strong> <xsl:value-of select="title" /> - 
                                                        <strong>Duration:</strong> <xsl:value-of select="duration" />
                                                    </li>
                                                </xsl:for-each>
                                            </ul>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
