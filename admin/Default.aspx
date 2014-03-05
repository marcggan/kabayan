<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/login.css" rel="stylesheet">
</head>
<body>
    <div class="container">
    <form id="form1" runat="server">
        <div class="form-signin">
        <h3 class="form-signin-heading">Please log in</h3>
        <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Username" required="" autofocus=""></asp:TextBox>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder="Password" required="" ></asp:TextBox>
        <asp:Button ID="btnLogIn" runat="server" Text="Log In" 
            onclick="btnLogIn_Click" class="btn btn-lg btn-primary"/>
        <br />
        <asp:Label ID="lblCheck" runat="server" />
        </div>
    </form>
    </div>
</body>
</html>