<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QRcode_Reader._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="div_imagetranscrits"></div>
    <div id="qrcodeholder">
        <img src="https://api.qrserver.com/v1/create-qr-code/?data=HelloWorld&amp;size=100x100" alt="" title="" />
    </div>
    <div id="qrcodedata"> </div>
        <p id="msg"></p>
   <%-- <img id="qr-reponse-as-image" src="" alt="" title="" />
        Choose QR code image to read/scan:
        <input name="file" type="file" id="file" />
        <input type="submit" value="Read QR code" id="btn"/>--%>
        

     <p id="msgurl"></p>
        QR URL : 
   
        <input type="submit" value="Read QR code URL" id="btnurl"/>
        <input type="submit" value="Create QR" id="btn-create-qr"/>


    

    
    <script>
        $(document).ready(function (e) {
            $('#btnurl').on('click', function () {
                event.preventDefault();
              

                $.ajax({
                    url: 'http://api.qrserver.com/v1/read-qr-code/?fileurl=https://www.jqueryscript.net/images/Creating-A-QR-Code-Containing-A-URL-with-jQuery-qrcode.jpg', // point to server-side controller method
                    dataType: 'text', // what to expect back from the server
                    cache: false,
                    contentType: false,
                    processData: false,

                    type: 'POST',
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function (response) {
                        var json_response = response;
                        var html_response = JSON.parse(json_response);

                        var result = '';
                        $.each(html_response, function (i, item) {
                            result += 'type = ' + item.type + '<br/>';
                            result += 'seq = ' + item.symbol[0].seq + '<br/>';
                            result += 'data = ' + item.symbol[0].data + '<br/>';
                            result += 'error = ' + item.symbol[0].error + '<br/>';
                        });

                        //$('#msg').html(html_response); // display success response from the server
                        $('#qrcodedata').html(result);
                    },
                    error: function (response) {
                        $('#msg').html(response); // display error response from the server
                    }
                });
            });
        });

    </script>
   <%-- Generte QR--%>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.qrcode/1.0/jquery.qrcode.min.js"></script>
    <script>
        $(document).ready(function (e) {
            $('#qrcodeholder').hide();

            $('#btn-create-qr').on('click', function () {
                event.preventDefault();
             

                $('#qrcodeholder').show();
                
            });
        });

    </script>

   
</asp:Content>
