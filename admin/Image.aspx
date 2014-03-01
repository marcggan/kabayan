<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Image.aspx.cs" Inherits="admin_Image" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="gv">
    <h1><asp:Label ID="lblRoom" runat="server"></asp:Label> </h1>
    <div class="form-horizontal">
    <div class="form-group">
        <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblImagename" runat="server" Text="Image Name:"></asp:Label>
        <div class="col-xs-4"><asp:Textbox class="form-control" ID="txtImagename" runat="server"></asp:TextBox></div>
        <br/>
        <br/>
        <asp:Label class="col-xs-2 col-xs-offset-3 control-label" ID="lblBest" runat="server" Text="Best Image:"></asp:Label>
        <div class="col-xs-4"><asp:DropDownList class="form-control" ID="ddlImage" runat="server">
                <asp:ListItem Value="1">Yes</asp:ListItem>
                <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
            </asp:DropDownList></div>
        <br/>
        <br/>
        <div class="col-xs-3 col-xs-offset-4">
        <asp:FileUpload ID="FileUpload1" runat="server" />
        </div>
        <div class="col-xs-1">
        <asp:Button class="btn btn-primary btn-block" ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />
        </div>
        <br />
        <br />
        <hr />
        <asp:GridView class="gv" ID="GridView1" runat="server" AutoGenerateColumns="false" ShowHeader="false">
            <Columns>
                <asp:BoundField DataField="ImageName" HeaderText="Image Name" />
                <asp:ImageField DataImageUrlField="ImagePath" ControlStyle-Height="200" ControlStyle-Width="200" HeaderText="Image"/>
            </Columns>
        </asp:GridView>
    </div>
    </div>
</div>
</asp:Content>

