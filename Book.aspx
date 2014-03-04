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
        <div class="row">
        <asp:Button class="btn btn-default" ID="btnRoom" runat="server" 
            Text="Suggest a Room" onclick="btnRoom_Click" />
        </div>
    </div>
    <hr />
    <!-- Second Form -->
    <div class="container-fluid bookingform form2">
        <div class="row">
            <div class="col-xs-7">
                <h3>New Guest</h3>
                <div class="row">
                    <asp:Label class="col-xs-4 control-label" ID="lblLName" runat="server" Text="Last Name:"></asp:Label>
                    <div class="col-xs-5"><asp:Textbox class="form-control" ID="txtLName" runat="server"></asp:TextBox></div>
                    <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtLName" ValidationGroup="book"></asp:RequiredFieldValidator></div>
                </div>
                <br />
                <div class="row">
                    <asp:Label class="col-xs-4 control-label" ID="lblFName" runat="server" Text="First Name:"></asp:Label>
                    <div class="col-xs-5"><asp:Textbox class="form-control" ID="txtFName" runat="server"></asp:TextBox></div>
                    <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtFName" ValidationGroup="book"></asp:RequiredFieldValidator></div>
                </div>
                <br />
                <div class="row">
                    <asp:Label class="col-xs-4 control-label" ID="lblGender" runat="server" Text="Gender:"></asp:Label>
                    <div class="col-xs-5"><asp:DropDownList class="form-control" ID="ddlGender" runat="server">
                        <asp:ListItem Value="" Selected="True">Select your Gender</asp:ListItem>
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                    </asp:DropDownList></div>
                    <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="ddlGender" ValidationGroup="book"></asp:RequiredFieldValidator></div>
                </div>
                <br />
                <div class="row">
                    <asp:Label class="col-xs-4 control-label" ID="lblAddress" runat="server" Text="Address:"></asp:Label>
                    <div class="col-xs-5"><asp:Textbox class="form-control" ID="txtAddress" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox></div>
                    <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtAddress" ValidationGroup="book"></asp:RequiredFieldValidator></div>
                </div>
                <br />
                <div class="row">
                    <asp:Label class="col-xs-4 control-label" ID="lblCellPhone" runat="server" Text="Cell Phone:"></asp:Label>
                    <div class="col-xs-5"><asp:Textbox class="form-control" ID="txtCellPhone" runat="server"></asp:TextBox></div>
                    <div class="col-xs-3">
                    
                    <asp:RegularExpressionValidator ID="rfvCellPhone" runat="server"
                    ControlToValidate="txtCellPhone" ErrorMessage="Not a valid mobile number"
                    ValidationExpression="^([0]{1})([9]{1})([0-9]{9})$" ValidationGroup="book"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="txtCellphone" ValidationGroup="book"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <div class="row">
                    <asp:Label class="col-xs-4 control-label" ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                    <div class="col-xs-5"><asp:Textbox class="form-control" ID="txtEmail" runat="server"></asp:TextBox></div>
                    <div class="col-xs-3">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Not a Valid Email Address" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="book"
                    ></asp:RegularExpressionValidator>&nbsp;
                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="*" ToolTip="E-mail is required." ValidationGroup="book"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <div class="row">
                    <asp:Label class="col-xs-4 control-label" ID="lblPassword1" runat="server" Text="Password:"></asp:Label>
                    <div class="col-xs-5"><asp:Textbox class="form-control" ID="txtPassword1" runat="server" TextMode="Password"></asp:TextBox></div>
                    <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="txtPassword1" ValidationGroup="book"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Password does not match" ControlToValidate="txtPassword1" ControlToCompare="txtPassword2"></asp:CompareValidator></div>
                </div>
                <br />
                <div class="row">
                    <asp:Label class="col-xs-4 control-label" ID="lblPassword2" runat="server" Text="Re-type Password:"></asp:Label>
                    <div class="col-xs-5"><asp:Textbox class="form-control" ID="txtPassword2" runat="server" TextMode="Password"></asp:TextBox></div>
                    <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="txtPassword2" ValidationGroup="book"></asp:RequiredFieldValidator></div>
                </div>
                <br />
            </div><!--new customer-->
            <div class="col-xs-5">
                <h3>Return Guest</h3>
                <div class="row">
                    <asp:Label class="col-xs-3 control-label" ID="lblEmail2" runat="server" Text="Email:"></asp:Label>
                    <div class="col-xs-6"><asp:Textbox class="form-control" ID="txtEmail2" runat="server"></asp:TextBox></div>
                    <div class="col-xs-3">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail2"
                    ErrorMessage="Not a Valid Email Address" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="login"></asp:RegularExpressionValidator>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEmail2"
                    ErrorMessage="*" ToolTip="E-mail is required." ValidationGroup="login"></asp:RequiredFieldValidator>
                    <br /><asp:Label ID="lblCheck" runat="server"></asp:Label>
                    </div>
                    
                </div>
                <br />
                <div class="row">
                    <asp:Label class="col-xs-3 control-label" ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                    <div class="col-xs-6"><asp:Textbox class="form-control" ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></div>
                    <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtPassword" ValidationGroup="login"></asp:RequiredFieldValidator></div>
                </div>
                <div class="row">
                    <asp:Label ID="lblLogIn" runat="server"></asp:Label>
                    <br /><br />
                    <asp:Button class="btn btn-primary" ID="btnLogIn" runat="server" Text="Log In" ValidationGroup="login"
                        onclick="btnLogIn_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- Third Form --><hr />
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

