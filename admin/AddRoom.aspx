<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="AddRoom.aspx.cs" Inherits="admin_AddRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="form-horizontal">
        <div class="form-group">
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblRoomName" runat="server" Text="Room Name:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtRoomName" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtRoomName"></asp:RequiredFieldValidator>
            <asp:Label ID="lblCheck" runat="server"></asp:Label></div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblDetails" runat="server" Text="Details:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtDetails" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtDetails"></asp:RequiredFieldValidator></div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblLCapacity" runat="server" Text="Lying Capacity:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtLCapacity" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtLCapacity"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" Type="Integer" 
            MinimumValue="1" MaximumValue="2000" ControlToValidate="txtLCapacity" 
            ErrorMessage="Please enter a valid number" />
            </div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblMCapacity" runat="server" Text="Maximum Capacity:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtMCapacity" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtMCapacity"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator2" runat="server" Type="Integer" 
            MinimumValue="1" MaximumValue="2000" ControlToValidate="txtMCapacity" 
            ErrorMessage="Please enter a valid number" />
            </div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblPrice" runat="server" Text="Price per Night:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtPrice" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtPrice"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator3" runat="server" Type="Double" 
            MinimumValue="0.00" MaximumValue="999999.99" ControlToValidate="txtPrice" 
            ErrorMessage="Please enter a valid number" />
            </div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblExcess" runat="server" Text="Excess of Maximum:"></asp:Label>
            <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtExcess" runat="server"></asp:TextBox></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtExcess"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator4" runat="server" Type="Integer" 
            MinimumValue="0" MaximumValue="2000" ControlToValidate="txtExcess" 
            ErrorMessage="Please enter a valid number" />
            </div>
            <br/>
            <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblStatus" runat="server" Text="Status:"></asp:Label>
            <div class="col-xs-4"><asp:DropDownList class="form-control" ID="ddlStatus" runat="server">
                <asp:ListItem Value="" Selected="True">Select Room's Status</asp:ListItem>
                <asp:ListItem Value="Ready">Ready</asp:ListItem>
                <asp:ListItem Value="Dirty">Dirty</asp:ListItem>
                <asp:ListItem Value="Maintenance">Requires Maintenance</asp:ListItem>
            </asp:DropDownList></div>
            <div class="col-xs-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="ddlStatus"></asp:RequiredFieldValidator></div>
            <br/>


            <div class="col-xs-1 col-xs-offset-5">
            <asp:Button class="btn btn-block btn-primary" ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" CausesValidation="True" />
            </div>
            <div class="col-xs-1">
            <asp:Button class="btn btn-block btn-primary" ID="btnCancel" runat="server" Text="Cancel" 
                onclick="btnCancel_Click" CausesValidation="False" />
            </div>
        </div>
        </div>
    </div>
</asp:Content>

