<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Raport Sklepu</title>
                <style type="text/css">
                    <!--body {
                    background-image: url("background.jpg");
                    background-color: #cccccc;
                    }-->

                    table {
                    font-family: 'Century Gothic';
                    border-collapse: collapse;
                    text-align: center;
                    padding: 10px;
                    background-color: rgba(232, 240, 255, 0.5);
                    }

                    table.center {
                    margin-left:auto;
                    margin-right:auto;
                    }

                    tr#r01, tr#r02{
                    background-color: #d1e1ff;
                    }

                    table, th, td {
                    border: 1px solid #003293;
                    text-align: center;
                    padding: 10px;
                    }

                    h1{
                    font-family: Helvetica;
                    color: #003293;
                    font-size: 40px;
                    text-align: center;
                    }

                    h2{
                    font-family: Helvetica;
                    color: #002670;
                    font-size: 12pt;
                    text-align: left;
                    margin-left: 2%;
                    }
                </style>
            </head>
            <body>
                <h1>Raport Sklepu</h1>
                    <xsl:apply-templates select="shopReport/Autorzy"/>
                    <xsl:apply-templates select="shopReport/Lista_Produktow"/>
                    <xsl:apply-templates select="shopReport/Podsumowanie"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="shopReport/Autorzy">
        <h2>Autorzy</h2>
        <h2>
            <xsl:value-of select="@Imię"/>
            <xsl:value-of select="@Nazwisko"/>
            <xsl:value-of select="@Indeks"/>
        </h2>
    </xsl:template>

    <xsl:template match="shopReport/Lista_Produktow">
        <table style="text-align: center" class="center">
            <tr id="r01">
                <th>Producent</th>
                <th>Model</th>
                <th>Cena</th>
                <th>Waluta</th>
                <th>Rozmiar</th>
                <th>Płeć</th>
                <th>Kolor</th>
                <th>Typ</th>
                <th>Rok</th>
                <th>Aktualny Rok</th>
            </tr>
            <xsl:for-each select="Produkt">
                <xsl:sort select="@PriceCurrency" data-type="text" order="ascending" />
                <xsl:sort select="@Price" data-type="number" order="descending" />
                <tr>
                    <td>
                        <xsl:value-of select="@Producent"/>
                    </td>
                    <td>
                        <xsl:value-of select="@Model"/>
                    </td>
                    <td>
                        <xsl:value-of select="@Price"/>
                    </td>
                    <td>
                        <xsl:value-of select="@PriceCurrency"/>
                    </td>
                    <td>
                        <xsl:value-of select="@Size"/>
                    </td>
                    <td>
                        <xsl:value-of select="@Sex"/>
                    </td>
                    <td>
                        <xsl:value-of select="@Colour"/>
                    </td>
                    <td>
                        <xsl:value-of select="@Type"/>
                    </td>
                    <td>
                        <xsl:value-of select="@Year"/>
                    </td>
                    <td>
                        <xsl:value-of select="@CurrentYear"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>




</xsl:stylesheet>
