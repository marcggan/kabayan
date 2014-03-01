<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditService.aspx.cs" Inherits="admin_EditService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="form-horizontal">
        <div class="form-group">
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblServiceName" runat="server" Text="Service Name:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtServiceName" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtServiceName"></asp:RequiredFieldValidator></div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblCategory" runat="server" Text="Category:"></asp:Label>
            <div class="col-xs-4"><asp:DropDownList class="form-control" ID="ddlCategory" runat="server"></asp:DropDownList></div>

            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblDescription" runat="server" Text="Description:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtDescription" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtDescription"></asp:RequiredFieldValidator></div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblPrice" runat="server" Text="Price:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtPrice" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtPrice"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator3" runat="server" Type="Double" 
            MinimumValue="0.00" MaximumValue="999999.99" ControlToValidate="txtPrice" 
            ErrorMessage="Please enter a valid number" />
            </div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblCapacity" runat="server" Text="Capacity:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtCapacity" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtCapacity"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" Type="Integer" 
            MinimumValue="1" MaximumValue="200" ControlToValidate="txtCapacity" 
            ErrorMessage="Please enter a valid number" />
            </div>
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

