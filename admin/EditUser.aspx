<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditUser.aspx.cs" Inherits="admin_EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="form-horizontal">
        <div class="form-group">
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblUsername" runat="server" Text="Username:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtUsername" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtUsername"></asp:RequiredFieldValidator></div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblLName" runat="server" Text="Last Name:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtLName" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtLName"></asp:RequiredFieldValidator></div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblFName" runat="server" Text="First Name:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtFName" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtFName"></asp:RequiredFieldValidator></div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblGender" runat="server" Text="Gender:"></asp:Label>
            <div class="col-xs-4"><asp:DropDownList class="form-control" ID="ddlGender" runat="server">
                <asp:ListItem Value="" Selected="True">Select your Gender</asp:ListItem>
                <asp:ListItem Value="Male">Male</asp:ListItem>
                <asp:ListItem Value="Female">Female</asp:ListItem>
            </asp:DropDownList></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="ddlGender"></asp:RequiredFieldValidator></div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblAddress" runat="server" Text="Address:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtAddress" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtAddress"></asp:RequiredFieldValidator></div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblCellPhone" runat="server" Text="Cell Phone:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtCellPhone" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtCellPhone"></asp:RequiredFieldValidator></div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblEmail" runat="server" Text="Email:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtEmail" runat="server"></asp:TextBox></div>
            <div class="col-xs-3">
            
            
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="Not a Valid Email Address" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            ></asp:RegularExpressionValidator>&nbsp;
            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="*" ToolTip="E-mail is required."></asp:RequiredFieldValidator>
            
            
            </div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblRole" runat="server" Text="Role:"></asp:Label>
            <div class="col-xs-4"><asp:DropDownList class="form-control" ID="ddlRole" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="roleName" DataValueField="roleId">
                <asp:ListItem Selected="True">Select a role</asp:ListItem>

            </asp:DropDownList></div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT roleId,roleName FROM roles"></asp:SqlDataSource>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="ddlRole"></asp:RequiredFieldValidator></div>
            <br/>
            <div class="col-xs-1 col-xs-offset-5">
            <asp:Button class="btn btn-block btn-primary" ID="btnEdit" runat="server" Text="Edit" onclick="btnEdit_Click" CausesValidation="True" />
            </div>
            <div class="col-xs-1">
            <asp:Button class="btn btn-block btn-primary" ID="btnCancel" runat="server" Text="Cancel" 
                onclick="btnCancel_Click" CausesValidation="False" />
            </div>
        </div>
        </div>
    </div>
</asp:Content>