<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditBooking.aspx.cs" Inherits="admin_EditBooking" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/datepicker.css" rel="stylesheet" />
    <link href="../less/datepicker.less" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
                <asp:Label class="col-xs-12 control-label" ID="lblError" runat="server"></asp:Label>
    <div class="container">
        <div class="form-horizontal">
        <div class="form-group">
            <!-- Error message -->


            <asp:Label class="col-xs-4 control-label" ID="lblCustomer" runat="server" Text="Customer:"></asp:Label>
            <div class="col-xs-7">
            <asp:DropDownList class="form-control" ID="ddlCustomer" runat="server">
            </asp:DropDownList>
            </div>
            <div class="col-xs-1">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="ddlCustomer"></asp:RequiredFieldValidator>
            </div>

            <asp:Label class="col-xs-4 control-label" ID="lblRoom" runat="server" Text="Room:"></asp:Label>
            <div class="col-xs-7">
            <asp:DropDownList class="form-control" ID="ddlRoom" runat="server">
            </asp:DropDownList>
            </div>
            <div class="col-xs-1">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="ddlRoom"></asp:RequiredFieldValidator>
            </div>

            <asp:Label class="col-xs-4 control-label" ID="lblStart" runat="server" Text="Start Date:"></asp:Label>
            <div class="col-xs-7">
            <asp:TextBox ID="txtStart" ReadOnly="true" class="form-control checkin datepicker" runat="server"></asp:TextBox>
            </div>
            <div class="col-xs-1">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="txtStart"></asp:RequiredFieldValidator>
            </div>

            <asp:Label class="col-xs-4 control-label" ID="lblEnd" runat="server" Text="End Date:"></asp:Label>
            <div class="col-xs-7">
            <asp:TextBox ID="txtEnd" ReadOnly="true" class="form-control checkout datepicker" runat="server"></asp:TextBox>
            </div>
            <div class="col-xs-1">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="txtEnd"></asp:RequiredFieldValidator>
            </div>

            <asp:Label class="col-xs-4 control-label" ID="lblStatus" runat="server" Text="Status:"></asp:Label>
            <div class="col-xs-7">
            <asp:DropDownList class="form-control" ID="ddlStatus" runat="server">
                <asp:ListItem Selected="True" Value="0">New</asp:ListItem>
                <asp:ListItem Selected="False" Value="1">Confirmed</asp:ListItem>
                <asp:ListItem Selected="False" Value="2">Checked In</asp:ListItem>
                <asp:ListItem Selected="False" Value="3">Checked Out</asp:ListItem>
            </asp:DropDownList>
            </div>
            <div class="col-xs-1">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="ddlStatus"></asp:RequiredFieldValidator>
            </div>

            <asp:Label class="col-xs-4 control-label" ID="lblGuests" runat="server" Text="Number of guests:"></asp:Label>
            <div class="col-xs-7">
            <asp:TextBox class="form-control" ID="txtGuests" runat="server"></asp:TextBox>
            </div>
            <div class="col-xs-1">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="txtGuests"></asp:RequiredFieldValidator>
            </div>

            <asp:Label class="col-xs-4 control-label" ID="lblPayment" runat="server" Text="Payment Method:"></asp:Label>
            <div class="col-xs-7">
            <asp:DropDownList class="form-control" ID="ddlPayment" runat="server">
            </asp:DropDownList>
            </div>
            <div class="col-xs-1">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*" ControlToValidate="ddlPayment"></asp:RequiredFieldValidator>
            </div>

            <asp:Label class="col-xs-4 control-label" ID="lblPaid" runat="server" Text="Paid:"></asp:Label>
            <div class="col-xs-7">
            <asp:DropDownList class="form-control" ID="ddlPaid" runat="server">
                <asp:ListItem Selected="True" Value="0">0</asp:ListItem>
                <asp:ListItem Selected="False" Value="50">50</asp:ListItem>
                <asp:ListItem Selected="False" Value="100">100</asp:ListItem>
            </asp:DropDownList>
            </div>
            <div class="col-xs-1">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*" ControlToValidate="ddlPaid"></asp:RequiredFieldValidator>
            </div>
            <div class="col-xs-4">
            <br/><br/>
            <asp:Button class="btn btn-primary btn-block" ID="btnEdit" runat="server" Text="Edit" onclick="btnEdit_Click" CausesValidation="True" />
            </div>
            <div class="col-xs-4">
            <br/><br/>
            <asp:Button class="btn btn-primary btn-block" ID="btnDelete" runat="server" Text="Delete" 
                onclick="btnDelete_Click" CausesValidation="False" />
            </div>
            <div class="col-xs-4">
            <br/><br/>
            <asp:Button class="btn btn-primary btn-block" ID="btnCancel" runat="server" Text="Cancel" 
                onclick="btnCancel_Click" CausesValidation="False" />
            </div>
        </div>
        </div>
     </div>
    </form>

    <!--jQuery-->
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script src="../js/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../js/datepicker.js" type="text/javascript"></script>
</body>
</html>
