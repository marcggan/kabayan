<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Book.aspx.cs" Inherits="Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
.booking
{
    overflow:hidden;
    width:960px;
}
.bookingform
{
    width:960px;
}
.form1
{
    
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="content2 booking">
<div class="form-horizontal">
<div class="form-group">
    <div class="container-fluid bookingform form1">
        <!--CheckIn and CheckOut-->
        <div class="row firstform">
            <div class="col-xs-4 col-xs-offset-2">
                <asp:Label ID="lblCheckIn" runat="server" Text="Check In"></asp:Label>
                <br />
                <asp:TextBox ID="txtCheckIn" runat="server" class="checkin datepicker form-control"></asp:TextBox>
                <br /><br />
            </div>
            <div class="col-xs-4">
                <asp:Label ID="lblCheckOut" runat="server" Text="Check Out"></asp:Label>
                <br />
                <asp:TextBox ID="txtCheckOut" runat="server" class="datepicker checkout form-control"></asp:TextBox>
                <br /><br />
            </div>
        </div>
        <!--Capacity-->
        <div class="row">
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblCapacity" runat="server" Text="Capacity:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtCapacity" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtCapacity"></asp:RequiredFieldValidator>
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
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="ddlRoom"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
        <asp:Button class="btn btn-default" ID="btnRoom" runat="server" 
            Text="Suggest a Room" onclick="btnRoom_Click" />
        </div>
    </div>
    <br />
    <!-- Second Form -->
    <div class="container-fluid bookingform form2">
        
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblLName" runat="server" Text="Last Name:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtLName" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtLName"></asp:RequiredFieldValidator></div>
            <br/>
            <br />
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblFName" runat="server" Text="First Name:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtFName" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtFName"></asp:RequiredFieldValidator></div>
            <br/>
            <br />
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblGender" runat="server" Text="Gender:"></asp:Label>
            <div class="col-xs-4"><asp:DropDownList class="form-control" ID="ddlGender" runat="server">
                <asp:ListItem Value="" Selected="True">Select your Gender</asp:ListItem>
                <asp:ListItem Value="Male">Male</asp:ListItem>
                <asp:ListItem Value="Female">Female</asp:ListItem>
            </asp:DropDownList></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="ddlGender"></asp:RequiredFieldValidator></div>
            <br/>
            <br />
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblAddress" runat="server" Text="Address:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtAddress" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtAddress"></asp:RequiredFieldValidator></div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblCellPhone" runat="server" Text="Cell Phone:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtCellPhone" runat="server"></asp:TextBox></div>
            <div class="col-xs-3">
            
            <asp:RegularExpressionValidator ID="rfvCellPhone" runat="server"
            ControlToValidate="txtCellPhone" ErrorMessage="Not a valid mobile number"
            ValidationExpression="^([0]{1})([9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>
            
            </div>
            <br/>
            <br />
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblEmail" runat="server" Text="Email:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtEmail" runat="server"></asp:TextBox></div>
            <div class="col-xs-3">
                
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="Not a Valid Email Address" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            ></asp:RegularExpressionValidator>&nbsp;
            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="*" ToolTip="E-mail is required."></asp:RequiredFieldValidator>
            </div>
    </div>
    <!-- Third Form -->
    <div class="container-fluid bookingform form2">
        <div class="form-horizontal">
        <div class="form-group">
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="Label1" runat="server" Text="Payment Method:"></asp:Label>
                        <div class="col-xs-4"><asp:DropDownList class="form-control" ID="ddlPayment" runat="server">
                <asp:ListItem Value="" Selected="True">Select a payment method</asp:ListItem>
                <asp:ListItem Value="1">Deposit</asp:ListItem>
                <asp:ListItem Value="2">Paypal</asp:ListItem>
            </asp:DropDownList></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlGender"></asp:RequiredFieldValidator></div>
            <br/>
            <asp:Button class="btn btn-primary" ID="btnBook" runat="server" Text="Book" 
                onclick="btnBook_Click" />
        </div>
        </div>
    </div>

</div>
</div>
</div>
</asp:Content>

