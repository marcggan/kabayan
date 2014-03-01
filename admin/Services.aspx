<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="admin_Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:GridView ID="gvServices" runat="server" class="gv" AutoGenerateColumns="False" DataSourceID="SqlDataSource" 
        onselectedindexchanged="gvServices_SelectedIndexChanged" AllowPaging="True"
            AllowSorting="True" PageSize="8"
            DataKeyNames="serviceID" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="serviceID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="serviceID" />
                <asp:BoundField DataField="serviceName" HeaderText="Service Name" 
                    SortExpression="serviceName" />
                <asp:BoundField DataField="categoryName" HeaderText="Category" InsertVisible="False" 
                    ReadOnly="True" SortExpression="categoryName" />
                <asp:BoundField DataField="serviceDescription" HeaderText="Description" 
                    SortExpression="serviceDescription" />
                <asp:BoundField DataField="servicePrice" HeaderText="Price" 
                    SortExpression="servicePrice" />
                <asp:BoundField DataField="serviceCapacity" HeaderText="Capacity" 
                    SortExpression="serviceCapacity" />
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
            SelectCommand="SELECT services.serviceId,categories.categoryName,services.serviceName,services.serviceDescription,services.servicePrice,services.serviceCapacity FROM services INNER JOIN categories ON services.categoryId = categories.categoryId">
        </asp:SqlDataSource>
    </div>
    <br />
    <div class="col-xs-1 col-xs-offset-4">
    <asp:Button class="btn btn-primary btn-block" ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" CausesValidation="False" />
    </div>
    <div class="col-xs-1">
    <asp:Button CssClass="btn btn-primary btn-block disabled" ID="btnDelete" runat="server" Text="Delete" 
        onclick="btnDelete_Click" CausesValidation="False" 
        PostBackUrl="Services.aspx" />
    </div>
    <div class="col-xs-1">
    <asp:Button CssClass="btn btn-primary btn-block disabled" ID="btnUpdate" runat="server" Text="Update" onclick="btnUpdate_Click" CausesValidation="False" />
    </div>
    <div class="col-xs-1">
    <asp:Button class="btn btn-primary btn-block" ID="btnBack" runat="server" Text="Back" onclick="btnBack_Click" CausesValidation="False" />
    </div>
</asp:Content>

