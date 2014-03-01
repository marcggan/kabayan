<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Rooms.aspx.cs" Inherits="admin_Rooms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:GridView ID="gvRooms" runat="server" class="gv" AutoGenerateColumns="False" DataSourceID="SqlDataSource" 
        onselectedindexchanged="gvRooms_SelectedIndexChanged" AllowPaging="True"
            AllowSorting="True" PageSize="8"
            DataKeyNames="roomID" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="roomID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="roomID" />
                <asp:BoundField DataField="roomName" HeaderText="Name" 
                    SortExpression="roomName" />
                <asp:BoundField DataField="roomDetails" HeaderText="Details" 
                    SortExpression="roomDetails" />
                <asp:BoundField DataField="roomLyingCapacity" HeaderText="Lying Capacity" 
                    SortExpression="roomLyingCapacity" />
                <asp:BoundField DataField="roomMaxCapacity" HeaderText="Maximum Capacity" 
                    SortExpression="roomMaxCapacity" />
                <asp:BoundField DataField="roomPricePerNight" HeaderText="Price Per Night" 
                    SortExpression="roomPricePerNight" />
                <asp:BoundField DataField="roomExcessofMax" HeaderText="ExcessofMax" 
                    SortExpression="roomExcessofMax" />
                <asp:BoundField DataField="roomStatus" HeaderText="Status" 
                    SortExpression="roomStatus" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:kabayanConnectionString %>" 
            SelectCommand="SELECT roomId, roomName,roomDetails,roomLyingCapacity,roomMaxCapacity,roomPricePerNight,roomExcessofMax,roomStatus FROM rooms ORDER BY roomId">
        </asp:SqlDataSource>
    </div>
    <br />
    <div class="col-xs-1 col-xs-offset-3">
    <asp:Button class="btn btn-primary btn-block" ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" CausesValidation="False" />
    </div>
    <div class="col-xs-1">
    <asp:Button CssClass="btn btn-primary btn-block disabled" ID="btnDelete" runat="server" Text="Delete" 
        onclick="btnDelete_Click" CausesValidation="False" 
        PostBackUrl="Rooms.aspx" />
    </div>
    <div class="col-xs-1">
    <asp:Button CssClass="btn btn-primary btn-block disabled" ID="btnUpdate" runat="server" Text="Update" onclick="btnUpdate_Click" CausesValidation="False" />
    </div>
    <div class="col-xs-2">
    <asp:Button CssClass="btn btn-primary btn-block disabled" ID="btnImage" runat="server" Text="Add Pictures" onclick="btnImage_Click" CausesValidation="False" />
    </div>
    <div class="col-xs-1">
    <asp:Button class="btn btn-primary btn-block" ID="btnBack" runat="server" Text="Back" onclick="btnBack_Click" CausesValidation="False" />
    </div>
</asp:Content>

