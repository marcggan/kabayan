<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Customer.aspx.cs" Inherits="Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3><asp:Label ID="lblWelcome" runat="server"></asp:Label></h3>
<div class="content2 booking">
<div class="form-horizontal">
<div class="form-group">
    <div class="container-fluid bookingform form1">
        <!--CheckIn and CheckOut-->
        <asp:Label ID="lblErrorDate" runat="server"></asp:Label>
        <div class="row">
            <div class="col-xs-4 col-xs-offset-2">
                <asp:Label ID="lblCheckIn" runat="server" Text="Check In"></asp:Label>
                <br />
                <asp:TextBox ID="txtCheckIn" runat="server" class="checkin datepicker form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtCheckIn" ValidationGroup="book"></asp:RequiredFieldValidator>
                <br /><br />
            </div>
            <div class="col-xs-4">
                <asp:Label ID="lblCheckOut" runat="server" Text="Check Out"></asp:Label>
                <br />
                <asp:TextBox ID="txtCheckOut" runat="server" class="datepicker checkout form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtCheckOut" ValidationGroup="book"></asp:RequiredFieldValidator>
                <br /><br />
            </div>
        </div>
        <!--Capacity-->
        <asp:Label ID="lblErrorCap" runat="server"></asp:Label>
        <div class="row">
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblCapacity" runat="server" Text="Capacity:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtCapacity" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtCapacity" ValidationGroup="book"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" Type="Integer" 
            MinimumValue="1" MaximumValue="2000" ControlToValidate="txtCapacity" 
            ErrorMessage="Please enter a valid number" />
            </div>
        </div>
        <br />
        <!--room-->   
        <div class="row">
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblRoom" runat="server" Text="Room:"></asp:Label>
            <div class="col-xs-4"><asp:DropDownList ID="ddlRoom" class="form-control" runat="server"></asp:DropDownList></asp:TextBox></div>
        </div>
        <br />
    </div>
    <hr />
    <div class="container-fluid bookingform form2">
        <div class="form-horizontal">
        <div class="form-group">
            <div class="row">
                <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblPayment" runat="server" Text="Payment Method:"></asp:Label>
                    <div class="col-xs-4"><asp:DropDownList class="form-control" ID="ddlPayment" runat="server">
                    <asp:ListItem Value="" Selected="True">Select a payment method</asp:ListItem>
                    <asp:ListItem Value="1">Deposit</asp:ListItem>
                    <asp:ListItem Value="2">Paypal</asp:ListItem>
                </asp:DropDownList></div>
                <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlPayment" ValidationGroup="book"></asp:RequiredFieldValidator></div>
            </div>
            <br />
            <div class="row">
                <asp:Label ID="lblError" runat="server"></asp:Label>
                <br /><br />
                <asp:Button class="btn btn-primary" ID="btnBook" runat="server" Text="Book" ValidationGroup="book"
                    onclick="btnBook_Click" />
            </div>
        </div>
        </div>
    </div>
</div>
</div>
</div>
</asp:Content>

