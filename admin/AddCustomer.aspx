<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="AddCustomer.aspx.cs" Inherits="admin_AddCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="form-horizontal">
        <div class="form-group">
            <div class="row">
                <asp:Label class="col-xs-3 col-sm-2 col-sm-offset-2 control-label" ID="lblLName" runat="server" Text="Last Name:"></asp:Label>
                <div class="col-xs-6 col-sm-4"><asp:Textbox class="form-control" ID="txtLName" runat="server"></asp:TextBox></div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtLName"></asp:RequiredFieldValidator>
            </div>
            <br/>
            <div class="row">
                <asp:Label class="col-xs-3 col-sm-2 col-sm-offset-2 control-label" ID="lblFName" runat="server" Text="First Name:"></asp:Label>
                <div class="col-xs-6 col-sm-4"><asp:Textbox class="form-control" ID="txtFName" runat="server"></asp:TextBox></div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtFName"></asp:RequiredFieldValidator></div>
                <br/>
            <div class="row">
                <asp:Label class="col-xs-3 col-sm-2 col-sm-offset-2 control-label" ID="lblGender" runat="server" Text="Gender:"></asp:Label>
                <div class="col-xs-6 col-sm-4"><asp:DropDownList class="form-control" ID="ddlGender" runat="server">
                    <asp:ListItem Value="" Selected="True">Select your Gender</asp:ListItem>
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:DropDownList></div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="ddlGender"></asp:RequiredFieldValidator>
            </div>
            <br/>
            <div class="row">
                <asp:Label class="col-xs-3 col-sm-2 col-sm-offset-2 control-label" ID="lblAddress" runat="server" Text="Address:"></asp:Label>
                <div class="col-xs-6 col-sm-4"><asp:Textbox class="form-control" ID="txtAddress" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox></div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
            </div>
            <br/>
            <div class="row">
                <asp:Label class="col-xs-3 col-sm-2 col-sm-offset-2 control-label" ID="lblCellPhone" runat="server" Text="Cell Phone:"></asp:Label>
                <div class="col-xs-6 col-sm-4"><asp:Textbox class="form-control" ID="txtCellPhone" runat="server"></asp:TextBox></div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtCellPhone"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="rfvCellPhone" runat="server"
                ControlToValidate="txtCellPhone" ErrorMessage="Not a valid mobile number"
                ValidationExpression="^([0]{1})([9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>
            </div>
            <br/>
            <div class="row">
                <asp:Label class="col-xs-3 col-sm-2 col-sm-offset-2 control-label" ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                <div class="col-xs-6 col-sm-4"><asp:Textbox class="form-control" ID="txtEmail" runat="server"></asp:TextBox></div>
                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="*" ToolTip="E-mail is required."></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="Not a Valid Email Address" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                <asp:Label ID="lblCheck" runat="server"></asp:Label>
            </div>
            <br/>
            <div class="row">
                <asp:Label class="col-xs-3 col-sm-2 col-sm-offset-2 control-label" ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                <div class="col-xs-6 col-sm-4"><asp:Textbox class="form-control" ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match" ControlToValidate="txtPassword" ControlToCompare="txtPassword2"></asp:CompareValidator>
            </div>
            <br/>
            <div class="row">
                <asp:Label class="col-xs-3 col-sm-2 col-sm-offset-2 control-label" ID="lblPassword2" runat="server" Text="Re-Type Password:"></asp:Label>
                <div class="col-xs-6 col-sm-4"><asp:Textbox class="form-control" ID="txtPassword2" runat="server" TextMode="Password"></asp:TextBox></div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtPassword2"></asp:RequiredFieldValidator>
                <br/>
            </div>
            <br />
            <div class="row">
                <div class="col-xs-4 col-xs-offset-3 col-sm-3 col-sm-offset-2">
                <asp:Button class="btn btn-block btn-primary" ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" CausesValidation="True" />
                </div>
                <div class="col-xs-4 col-sm-3">
                <asp:Button class="btn btn-block btn-primary" ID="btnCancel" runat="server" Text="Cancel" 
                    onclick="btnCancel_Click" CausesValidation="False" />
                </div>
            </div>
        </div>
        </div>
        
    </div>

</asp:Content>

