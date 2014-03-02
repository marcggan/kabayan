<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmailTest.aspx.cs" Inherits="EmailTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="lblSubject" runat="server" Text="Name:"></asp:Label>
    <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblMessage" runat="server" Text="Message:"></asp:Label>
    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" MaxLength="2"></asp:TextBox>
    <br />
    <asp:Button ID="btnSend" runat="server" OnClick="btnSend_Click" Text="Send" />
    </div>
    </form>
</body>
</html>
