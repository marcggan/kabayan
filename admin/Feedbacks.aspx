<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Feedbacks.aspx.cs" Inherits="admin_Feedbacks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:GridView ID="gvFeedbacks" runat="server" class="gv" AutoGenerateColumns="False" DataSourceID="SqlDataSource" 
        AllowPaging="True"
            AllowSorting="False" PageSize="10"
            DataKeyNames="feedbackID" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="feedbackID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="feedbackID" />
                <asp:BoundField DataField="feedbackSubject" HeaderText="Subject" 
                    SortExpression="feedbackName" />
                <asp:BoundField DataField="feedbackmessage" HeaderText="Massage" 
                    SortExpression="feedbackGender" />

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
            SelectCommand="SELECT feedbackId, feedbackSubject,feedbackMessage FROM feedbacks">
        </asp:SqlDataSource>
    </div>
</asp:Content>

