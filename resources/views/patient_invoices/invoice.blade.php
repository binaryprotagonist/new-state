<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Factura #{{ $patient_invoice->title }}</title>
    <style>
        @page {
            margin: 25px;
        }

        body {
            color: #001028;
            background: #FFFFFF;
            font-family: sans-serif;
            font-size: 12px;
            margin-bottom: 50px;
        }

        a {
            color: #5D6975;
            text-decoration: underline;
        }

        h1 {
            color: #5D6975;
            font-size: 2.8em;
            line-height: 1.4em;
            font-weight: bold;
            margin: 0;
        }

        table {
            width: 100%;
            border-spacing: 0;
            margin-bottom: 20px;
        }

        th {
            padding: 5px 10px;
            color: #5D6975;
            border-bottom: 1px solid #C1CED9;
            white-space: nowrap;
            font-weight: normal;
        }

        td {
            padding: 10px;
        }

        table.alternate tr:nth-child(odd) td {
            background: #F5F5F5;
        }

        th.amount, td.amount {
            text-align: right;
        }

        .info {
            color: #5D6975;
            font-weight: bold;
        }

        .footer {
            position: fixed;
            height: 50px;
            width: 100%;
            bottom: 0px;
            text-align: center;
        }

    </style>
</head>
<body>

<table>
    <tr>
        <td style="width: 50%;" valign="top">
            <h1>FACTURA</h1>
            <span class="info">FACTURA </span>{{ $patient_invoice->title }}<br>
            @php
                $date=date_create($patient_invoice->due_date);
                $date=date_format($date,"d-m-Y");
            @endphp
            <span class="info">EMITITDO</span> {{ $date }}<br><br>
            <span class="info">Client</span><br>{{ $patient_invoice->patient->name }} {{ $patient_invoice->patient->last_name }}<br>
        </td>
        <td style="width: 50%; text-align: right;" valign="top">
            <img src="https://www.sateserveisassistencials.com/wp-content/themes/shard/images/logo.png" /><br>
            SATE SERVEIS ASSISTENCIALS S.L.
            <a href="mailto:info@sateserveisassistencials.com">info@sateserveisassistencials.com</a>
        </td>
    </tr>
</table>

<table class="alternate">
    <thead>
        <tr>
            <th>PRODUCTO</th>
            <th class="amount">CANTIDAD</th>
            <th class="amount">TIPUS IVA</th>
            <th class="amount">PRECIO SIN IVA</th>
            <th>IVA</th>
            <th class="amount">TOTAL</th>
        </tr>
    </thead>
    <tbody>
        <?php $total_iva = $total = 0; ?>

        @foreach ($patient_invoice->patient_invoice_items as $item)
            <?php
                $total_item = $item->quantity * $item->price;
                $iva = ($item->tax  / 100 ) * $total_item;
                $total_item = $total_item + $iva;
                $total_iva += $iva;
                $total += $total_item;
            ?>
            <tr>
                <td>{!! $item->title !!} </td>
                <td nowrap class="amount">{{ $item->quantity }}</td>
                <td nowrap class="amount">{{ $item->tax }} %</td>
                <td nowrap class="amount">{{ $item->price }} €</td>
                <td nowrap class="amount">{{ $iva }} €</td>
                <td nowrap class="amount">{{ $total_item }} €</td>
            </tr>
        @endforeach
        <tr>
            <td colspan="5" class="amount">SUB-TOTAL</td>
            <td class="amount">{{ $total - $total_iva }} €</td>
        </tr>
        <tr>
            <td colspan="5" class="amount">TOTAL IVA</td>
            <td class="amount">{{ $total_iva }} €</td>
        </tr>
        <tr>
            <td colspan="5" class="amount">TOTAL</td>
            <td class="amount">{{ $total }} €</td>
        </tr>
    </tbody>

</table>

<table style="margin-top: 50px;">
    <tr>
        <th>TERMES I CONDICIONS</th>
    </tr>
    <tr>
        <td>De conformitat amb el disposat per la Llei Orgànica 15/1999, de 13 de desembre, de Protecció de Dades de caràcter personal, dono
permís per a que les meves dades siguin incorporades en un fitxer responsabilitat de SATE SERVEIS ASISSTENCIALS i que sigui
tractades amb la finalitat de mantenir, desenvolupar i controlar la relació contractual. Així mateix, declaro haver estat informat sobre la
possiblitat d'erxercir els drets d'accés, rectificació, cancel·lació i oposició, dirigint-me a SATE SERVEIS ASISSTENCIALS al carrer Sant
Joan 8 Baix de Roquetes; o bé remetent un missatge de correu electrònic a administracio@sateserveisassistencials.com</td>
    </tr>
</table>

</body>
</html>
