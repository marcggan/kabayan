<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="admin_Employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:GridView ID="gvUsers" runat="server" class="gv" AutoGenerateColumns="False" DataSourceID="SqlDataSource" 
        onselectedindexchanged="gvUsers_SelectedIndexChanged" AllowPaging="True"
            AllowSorting="True" PageSize="10"
            DataKeyNames="userID" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="userID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="userID" />
                <asp:BoundField DataField="username" HeaderText="username" 
                    SortExpression="username" />
                <asp:BoundField DataField="userLName" HeaderText="Last Name" 
                    SortExpression="userLName" />
                <asp:BoundField DataField="userFName" HeaderText="First Name" 
                    SortExpression="userFName" />
                <asp:BoundField DataField="userGender" HeaderText="Gender" 
                    SortExpression="userGender" />
                <asp:BoundField DataField="userAddress" HeaderText="Address" 
                    SortExpression="userAddress" />
                <asp:BoundField DataField="userCellPhone" HeaderText="CellPhone" 
                    SortExpression="userCellPhone" />
                <asp:BoundField DataField="userEmail" HeaderText="Email" 
                    SortExpression="userEmail" />
                <asp:BoundField DataField="roleName" HeaderText="Role" 
                    SortExpression="roleName" />
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
            SelectCommand="SELECT users.userID, users.username, users.userLName, users.userFName, users.userGender, users.userAddress, users.userCellPhone, users.userEmail, roles.roleName FROM users INNER JOIN roles ON users.userID = roles.roleID">
        </asp:SqlDataSource>
    </div>
    <br />
    <div class="col-xs-1 col-xs-offset-4">
    <asp:Button class="btn btn-primary btn-block" ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" CausesValidation="False" />
    </div>
    <div class="col-xs-1">
    <asp:Button CssClass="btn btn-primary btn-block disabled" ID="btnDelete" runat="server" Text="Delete" 
        onclick="btnDelete_Click" CausesValidation="False" 
        PostBackUrl="Users.aspx" />
    </div>
    <div class="col-xs-1">
    <asp:Button CssClass="btn btn-primary btn-block disabled" ID="btnUpdate" runat="server" Text="Update" onclick="btnUpdate_Click" CausesValidation="False" />
    </div>
    <div class="col-xs-1">
    <asp:Button class="btn btn-primary btn-block" ID="btnBack" runat="server" Text="Back" onclick="btnBack_Click" CausesValidation="False" />
    </div>
</asp:Content>

